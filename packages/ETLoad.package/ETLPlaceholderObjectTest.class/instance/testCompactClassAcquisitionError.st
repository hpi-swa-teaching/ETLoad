testing
testCompactClassAcquisitionError
	| header compactClasses placeholder |
	
	header := ETLTestData oneWordHeader copy
		compactClassIndex: 1;
		yourself.
	compactClasses := { nil }, (1 to: 31).
	placeholder := ETLPlaceholderObject newFrom: header and: nil.
	self
		should: [ placeholder
			acquireClassFromMap: nil
			orCompactClasses: compactClasses. ]
		raise: ETLIncompatibleObjectError.