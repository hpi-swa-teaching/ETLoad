testing
testResolvingOfInternalOops
	| oopMap internalObject0 internalObject100 invalidMarker |

	invalidMarker := Object new.
	internalObject100 := Object new.
	internalObject0 := Object new.
	oopMap := ETLOopMap
		newFromInternalObjects: (
			Dictionary 
				with: 16r0 -> internalObject0 
				with: 16r100 -> internalObject100)
		andOutPointers: { }.

	self assert: internalObject0 
		identical: (oopMap resolveInternalPointer: 16r0 ifInvalid: [ self fail. ]).
	self assert: internalObject100 
		identical: (oopMap resolveInternalPointer: 16r100 ifInvalid: [ self fail. ]).

	self assert: invalidMarker 
		identical: (oopMap resolveInternalPointer: 16r4  ifInvalid: [ invalidMarker. ]).