fileIn/Out
comeFullyUpOnReload: smartRefStream
	"fix up the objects in the segment that changed size.  An object in the segment is the wrong size for the modern version of the class. Construct a fake class that is the old size.  Replace the modern class with the old one in outPointers.  Load the segment. Traverse the instances, making new instances by copying fields, and running conversion messages.  Keep the new instances.  Bulk forward become the old to the new.  Let go of the fake objects and classes.
	After the install (below), arrayOfRoots is filled in. Globalize new classes.  Caller may want to do some special install on certain objects in arrayOfRoots.
	May want to write the segment out to disk in its new form."

	| mapFakeClassesToReal receiverClasses rootsToUnhiberhate myProject forgetDoItsClasses endianness |

	forgetDoItsClasses := Set new.
	RecentlyRenamedClasses := nil.		"in case old data hanging around"
	mapFakeClassesToReal := smartRefStream reshapedClassesIn: outPointers.
	"Dictionary of just the ones that change shape. Substitute them in outPointers."
	self fixCapitalizationOfSymbols.
	endianness := self endianness.
	arrayOfRoots := self loadSegmentFrom: segment outPointers: outPointers.
	self checkAndReportLoadError.
		"Can't use install.  Not ready for rehashSets"
	mapFakeClassesToReal isEmpty ifFalse: [
		self reshapeClasses: mapFakeClassesToReal refStream: smartRefStream
	].
	"When a Project is stored, arrayOfRoots has all objects in the project, except those in outPointers"
	arrayOfRoots do: [:importedObject | | existing |
		((importedObject isMemberOf: WideString) or: [importedObject isMemberOf: WideSymbol]) ifTrue: [
			importedObject mutateJISX0208StringToUnicode.
			importedObject class = WideSymbol ifTrue: [
				"self halt."
				Symbol hasInterned: importedObject asString ifTrue: [:multiSymbol |
					multiSymbol == importedObject ifFalse: [
						importedObject becomeForward: multiSymbol.
					].
				].
			].
		].
		(importedObject isKindOf: TTCFontSet) ifTrue: [
			existing := TTCFontSet
							familyName: importedObject familyName
							pointSize: importedObject pointSize.	"supplies default"
			existing == importedObject ifFalse: [importedObject becomeForward: existing].
		].
	].
	"Smalltalk garbageCollect.   MultiSymbol rehash.  These take time and are not urgent, so don't to them.  In the normal case, no bad MultiSymbols will be found."

	receiverClasses := self restoreEndianness: (endianness ~~ Smalltalk endianness).		"rehash sets"
	smartRefStream checkFatalReshape: receiverClasses.

	"Classes in this segment."
	arrayOfRoots do: [:importedObject |
		importedObject class class == Metaclass ifTrue: [
			forgetDoItsClasses add: importedObject.
			self declare: importedObject]].
	arrayOfRoots do: [:importedObject |
		importedObject isCompiledMethod ifTrue: [
			importedObject sourcePointer > 0 ifTrue: [importedObject zapSourcePointer]].
		(importedObject isKindOf: Project) ifTrue: [
			myProject := importedObject.
			importedObject ensureChangeSetNameUnique.
			Project addingProject: importedObject.
			importedObject restoreReferences.
			self dependentsRestore: importedObject]].

	rootsToUnhiberhate := arrayOfRoots select: [:importedObject |
		importedObject respondsTo: #unhibernate
	"ScriptEditors and ViewerFlapTabs"
	].
	myProject ifNotNil: [
		myProject world setProperty: #thingsToUnhibernate toValue: rootsToUnhiberhate asArray.
	].

	mapFakeClassesToReal isEmpty ifFalse: [
		mapFakeClassesToReal keysAndValuesDo: [:aFake :aReal |
			aFake removeFromSystemUnlogged.
			"do not assign the fake's hash to the real class"
			aFake becomeForward: aReal copyHash: false].
		SystemOrganization removeEmptyCategories].
	forgetDoItsClasses do: [:c | c forgetDoIts].
	"^ self"
