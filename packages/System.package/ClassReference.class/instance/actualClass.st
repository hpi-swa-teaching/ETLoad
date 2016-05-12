accessing
actualClass 
	| actualClass |
	actualClass := Smalltalk at: classSymbol ifAbsent: [^nil].
	^classIsMeta ifTrue: [actualClass class] ifFalse: [actualClass]