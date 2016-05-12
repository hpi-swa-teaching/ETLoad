statistics
classNameAt: index
	| ccIndex |
	ccIndex := self compactIndexAt: index.
	ccIndex = 0 ifFalse:[^(Smalltalk compactClassesArray at: ccIndex) name].
	ccIndex := segment at: index-1.
	(ccIndex bitAnd: 16r80000000) = 0 ifTrue:[
		"within segment; likely a user object"
		^#UserObject].
	ccIndex := (ccIndex bitAnd: 16r7FFFFFFF) bitShift: -2.
	^(outPointers at: ccIndex) name