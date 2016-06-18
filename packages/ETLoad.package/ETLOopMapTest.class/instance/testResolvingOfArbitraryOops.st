testing
testResolvingOfArbitraryOops
	| oopMap internalObject outPointerObject invalidMarker |
	
	internalObject := Object new.
	outPointerObject := Object new.
	invalidMarker := Object new.
	oopMap := ETLOopMap
		newFromInternalObjects: (Dictionary with: 16r0 -> internalObject)
		andOutPointers: { outPointerObject }.

	"small integer"
	self assert: 42 equals: (oopMap resolve: 85 ifInvalid: [ self fail. ]). "85 = (42 << 1) + 1"
	
	"internal pointer"
	self assert: (internalObject) identical: (oopMap resolve: 16r0 ifInvalid: [ self fail. ]).
	self assert: (invalidMarker) identical: (oopMap resolve: 16r4 ifInvalid: [ invalidMarker. ]).
	
	"out pointer"
	self assert: (outPointerObject) 
		identical: (oopMap resolve: 16r80000004 ifInvalid: [ self fail. ]).
	self assert: (invalidMarker) 
		identical: (oopMap resolve: 16r80000008 ifInvalid: [ invalidMarker. ]).
	
	"invalid oop"
	self assert: (invalidMarker) identical: (oopMap resolve: 16r2 ifInvalid: [ invalidMarker. ]).