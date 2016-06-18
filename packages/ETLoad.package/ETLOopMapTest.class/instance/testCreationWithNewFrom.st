testing
testCreationWithNewFrom
	| oopMap |

	oopMap := ETLOopMap newFromInternalObjects: (Dictionary with: 42 -> 43) andOutPointers: { 4711 }.
	self assert: (Dictionary with: 42 -> 43) equals: oopMap internalObjects.
	self assert: { 4711 } equals: oopMap outPointers