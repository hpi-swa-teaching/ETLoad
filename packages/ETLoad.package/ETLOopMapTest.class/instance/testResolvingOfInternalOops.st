testing
testResolvingOfInternalOops
	| oopMap |
	
	oopMap := ETLOopMap
		newFromInternalObjects: (Dictionary with: 16r0 -> 42 with: 16r100 -> 12345)
		andOutPointers: { }.
	self assert: 42 equals: (oopMap resolveInternalPointer: 16r0 ifInvalid: [ self fail. ]).
	self assert: 12345 equals: (oopMap resolveInternalPointer: 16r100 ifInvalid: [ self fail. ]).
	self assert: 987 equals: (oopMap resolveInternalPointer: 16r4  ifInvalid: [ 987. ]).