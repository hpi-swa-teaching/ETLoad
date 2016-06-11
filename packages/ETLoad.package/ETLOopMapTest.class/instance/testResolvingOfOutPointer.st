testing
testResolvingOfOutPointer
	| oopMap dummyObject  |
	
	dummyObject := Object new.
	oopMap := ETLOopMap newFromInternalObjects: Dictionary new andOutPointers: (1 to: 4) asArray.
	self assert: 1 equals: (oopMap resolveOutPointer: 16r80000004 ifInvalid: [ self fail. ]).
	self assert: 4 equals: (oopMap resolveOutPointer: 16r80000010 ifInvalid: [ self fail. ]).
	self
		assert: dummyObject
		identical: (oopMap resolveOutPointer: 16r80000014 ifInvalid: [ dummyObject. ]).