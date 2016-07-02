testing
testPlaceholderClassAcquisition
	| classDummy header placeholder oopMap |
	
	classDummy := Object new.
	header := ETLTestData twoWordHeader
		classOop: 4;
		yourself.
	placeholder := ETLPlaceholderObject newFrom: header and: (ReadStream on: { }).
	oopMap := ETLOopMap
		newFromInternalObjects: (Dictionary with: 4 -> classDummy)
		andOutPointers: { }.
	ETLSegmentLoader new acquireClassesFor: { placeholder } usingMap: oopMap.
	self assert: classDummy identical: placeholder objectClass.