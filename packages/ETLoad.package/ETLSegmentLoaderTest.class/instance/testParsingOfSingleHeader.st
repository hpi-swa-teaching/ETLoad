testing
testParsingOfSingleHeader
	self
		assert: ETLTestData oneWordHeader
		equals: (ETLSegmentLoader
			newFor: ETLTestData oneWordHeaderData)
			parseHeader.

	self
		assert: ETLTestData twoWordHeader
		equals: (ETLSegmentLoader
			newFor: ETLTestData twoWordHeaderData)
			parseHeader.
	self
		assert: ETLTestData threeWordHeader
		equals: (ETLSegmentLoader
			newFor: ETLTestData threeWordHeaderData)
			parseHeader.	