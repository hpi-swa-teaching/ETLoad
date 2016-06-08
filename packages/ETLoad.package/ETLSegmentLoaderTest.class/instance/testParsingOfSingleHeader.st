testing
testParsingOfSingleHeader
	self
		assert: ETLTestData oneWordHeader
		equals: (ETLSegmentLoader
			from: ETLTestData oneWordHeaderData)
			parseHeader.
	self
		assert: ETLTestData twoWordHeader
		equals: (ETLSegmentLoader
			from: ETLTestData twoWordHeaderData)
			parseHeader.
	self
		assert: ETLTestData threeWordHeader
		equals: (ETLSegmentLoader
			from: ETLTestData threeWordHeaderData)
			parseHeader.	