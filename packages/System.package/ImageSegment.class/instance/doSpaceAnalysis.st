statistics
doSpaceAnalysis
	"Capture statistics about the IS and print the number of instances per class and space usage"
	| index sz word hdrBits cc instCount instSpace |
	state == #activeCopy ifFalse:[self errorWrongState].
	instCount := IdentityDictionary new.
	instSpace := IdentityDictionary new.
	index := 2. 	"skip version word, first object"
	"go past extra header words"
	hdrBits := (segment at: index) bitAnd: 3.
	hdrBits = 1 ifTrue: [index := index+1].
	hdrBits = 0 ifTrue: [index := index+2].
	[index > segment size] whileFalse:[
		hdrBits := (word := segment at: index) bitAnd: 3.
		hdrBits = 2 ifTrue:[sz := word bitAnd: 16rFFFFFFFC].
		hdrBits = 0 ifTrue:[sz := ((segment at: index-2) bitAnd: 16rFFFFFFFC) + 8].
		hdrBits = 1 ifTrue:[sz := (word bitAnd: "SizeMask" 252) + 4].
		hdrBits = 3 ifTrue:[sz := word bitAnd: "SizeMask" 252].
		hdrBits = 2 
			ifTrue:[cc := #freeChunk]
			ifFalse:[cc := self classNameAt: index].
		instCount at: cc put: (instCount at: cc ifAbsent:[0]) + 1.
		instSpace at: cc put: (instSpace at: cc ifAbsent:[0]) + sz.
		index := self objectAfter: index].
	^{instCount. instSpace}