testing
testResolvingOfArbitraryOops
	| oopMap |
	
	oopMap := ETLOopMap
		newFromInternalObjects: (Dictionary with: 16r0 -> 123)
		andOutPointers: { 99 }.

	"small integer"
	self assert: 42 equals: (oopMap resolve: 85 ifInvalid: [ self fail. ]).
	
	"internal pointer"
	self assert: 123 equals: (oopMap resolve: 16r0 ifInvalid: [ self fail. ]).
	self assert: 456 equals: (oopMap resolve: 16r4 ifInvalid: [ 456 ]).
	
	"out pointer"
	self assert: 99 equals: (oopMap resolve: 16r80000004 ifInvalid: [ self fail. ]).
	self assert: 789 equals: (oopMap resolve: 16r80000008 ifInvalid: [ 789. ]).
	
	"invalid oop"
	self assert: 'abc' equals: (oopMap resolve: 16r2 ifInvalid: [ 'abc' ]).