testing
testNonCompactClassAcquisition
	| header class oopMap placeholder |
	
	header := ETLTestData twoWordHeader copy
		classOop: 0;
		yourself.
	class := Object new.
	oopMap := ETLOopMap
		newFromInternalObjects: (Dictionary with: 0 -> class)
		andOutPointers: { }.
	placeholder := ETLPlaceholderObject newFrom: header and: nil.
	placeholder acquireClassFromMap: oopMap orCompactClasses: nil.
	self assert: class identical: placeholder objectClass.