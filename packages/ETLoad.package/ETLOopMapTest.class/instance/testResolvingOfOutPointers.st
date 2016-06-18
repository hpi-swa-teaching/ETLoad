testing
testResolvingOfOutPointers
	| oopMap outPointer1 outPointer2 invalidMarker |
	
	outPointer1 := Object new.
	outPointer2 := Object new.
	invalidMarker := Object new.
	oopMap := ETLOopMap 
		newFromInternalObjects: Dictionary new 
		andOutPointers: { outPointer1 . outPointer2 }.
	self assert: outPointer1 
		identical: (oopMap resolveOutPointer: 16r80000004 ifInvalid: [ self fail. ]).
	self assert: outPointer2
		identical: (oopMap resolveOutPointer: 16r80000008 ifInvalid: [ self fail. ]).
	self assert: invalidMarker
		identical: (oopMap resolveOutPointer: 16r800000012 ifInvalid: [ invalidMarker. ]).