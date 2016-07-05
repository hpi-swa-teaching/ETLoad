testing
testNonCompactClassAcquisitionError
	| header oopMap placeholder |
	
	header := ETLTestData twoWordHeader copy
		classOop: 0;
		yourself.
	oopMap := ETLOopMap
		newFromInternalObjects: Dictionary new
		andOutPointers: { }.
	placeholder := ETLPlaceholderObject newFrom: header and: nil.
	self
		should: [ placeholder
			acquireClassFromMap: oopMap
			orCompactClasses: nil. ]
		raise: ETLIncompatibleObjectError.