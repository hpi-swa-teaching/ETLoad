loading
openName: aFileName stream: preStream fromDirectory: aDirectoryOrNil
withProjectView: existingView
	"Reconstitute a Morph from the selected file, presumed to be
represent a Morph saved via the SmartRefStream mechanism, and open it
in an appropriate Morphic world."

   	| morphOrList proj trusted localDir projStream archive mgr
projectsToBeDeleted baseChangeSet enterRestricted substituteFont
numberOfFontSubstitutes exceptions |
	(preStream isNil or: [preStream size = 0]) ifTrue: [
		ProgressNotification  signal: '9999 about to enter
project'.		"the hard part is over"
		^self inform:
'It looks like a problem occurred while
getting this project. It may be temporary,
so you may want to try again,' translated
	].
	ProgressNotification signal: '2:fileSizeDetermined
',preStream size printString.
	preStream isZipArchive
		ifTrue:[	archive := ZipArchive new readFrom: preStream.
				projStream := self
projectStreamFromArchive: archive]
		ifFalse:[projStream := preStream].
	trusted := SecurityManager default positionToSecureContentsOf:
projStream.
	trusted ifFalse:
		[enterRestricted := (preStream isTypeHTTP or:
[aFileName isNil])
			ifTrue: [Preferences securityChecksEnabled]
			ifFalse: [Preferences standaloneSecurityChecksEnabled].
		enterRestricted
			ifTrue: [SecurityManager default enterRestrictedMode
				ifFalse:
					[preStream close.
					^ self]]].

	localDir := Project squeakletDirectory.
	aFileName ifNotNil: [
		(aDirectoryOrNil isNil or: [aDirectoryOrNil pathName
~= localDir pathName]) ifTrue: [
			localDir deleteFileNamed: aFileName.
			(localDir fileNamed: aFileName) binary
				nextPutAll: preStream contents;
				close.
		].
	].
	morphOrList := projStream asUnZippedStream.
	preStream sleep.		"if ftp, let the connection close"
	ProgressNotification  signal: '3:unzipped'.
	ResourceCollector current: ResourceCollector new.
	baseChangeSet := ChangeSet current.
	self useTempChangeSet.		"named zzTemp"
	"The actual reading happens here"
	substituteFont := Preferences standardEToysFont copy.
	numberOfFontSubstitutes := 0.
	exceptions := Set new.
	[[morphOrList := morphOrList fileInObjectAndCodeForProject]
		on: MissingFont do: [ :ex |
				exceptions add: ex.
				numberOfFontSubstitutes :=
numberOfFontSubstitutes + 1.
				ex resume: substituteFont ]]
			ensure: [ ChangeSet  newChanges: baseChangeSet].
	mgr := ResourceManager new initializeFrom: ResourceCollector current.
	mgr fixJISX0208Resource.
	mgr registerUnloadedResources.
	archive ifNotNil:[mgr preLoadFromArchive: archive cacheName:
aFileName].
	(preStream respondsTo: #close) ifTrue:[preStream close].
	ResourceCollector current: nil.
	ProgressNotification  signal: '4:filedIn'.
	ProgressNotification  signal: '9999 about to enter project'.
		"the hard part is over"
	(morphOrList isKindOf: ImageSegment) ifTrue: [
		proj := morphOrList arrayOfRoots
			detect: [:mm | mm isKindOf: Project]
			ifNone: [^self inform: 'No project found in
this file'].
		proj projectParameters at: #substitutedFont put: (
			numberOfFontSubstitutes > 0
				ifTrue: [substituteFont]
				ifFalse: [#none]).
		proj projectParameters at: #MultiSymbolInWrongPlace put: false.
			"Yoshiki did not put MultiSymbols into
outPointers in older images!"
		morphOrList arrayOfRoots do: [:obj |
			obj fixUponLoad: proj seg: morphOrList "imageSegment"].
		(proj projectParameters at: #MultiSymbolInWrongPlace) ifTrue: [
			morphOrList arrayOfRoots do: [:obj | (obj
isKindOf: HashedCollection) ifTrue: [obj rehash]]].

		proj resourceManager: mgr.
		"proj versionFrom: preStream."
		proj lastDirectory: aDirectoryOrNil.
		proj setParent: Project current.
		projectsToBeDeleted := OrderedCollection new.
		existingView ifNil: [
			ChangeSet allChangeSets add: proj changeSet.
			Project current openProject: proj.
				"Note: in MVC we get no further than the above"
		] ifNotNil: [
			(existingView project isKindOf: DiskProxy) ifFalse: [
				existingView project changeSet name: 
ChangeSet defaultName.
				projectsToBeDeleted add: existingView project.
			].
			(existingView owner isSystemWindow) ifTrue: [
				existingView owner model: proj
			].
			existingView project: proj.
		].
		ChangeSet allChangeSets add: proj changeSet.
		Project current projectParameters
			at: #deleteWhenEnteringNewProject
			ifPresent: [ :ignored |
				projectsToBeDeleted add: Project current.
				Project current removeParameter:
#deleteWhenEnteringNewProject.
			].
		projectsToBeDeleted isEmpty ifFalse: [
			proj projectParameters
				at: #projectsToBeDeleted
				put: projectsToBeDeleted.
		].
		^ ProjectEntryNotification signal: proj
	].
	Project current openViewAndEnter: morphOrList
