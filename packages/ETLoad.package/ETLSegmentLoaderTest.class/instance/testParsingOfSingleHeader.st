testing
testParsingOfSingleHeader
	self
		assert: ETLObjectHeaderTest oneWordHeader
		equals: (ETLSegmentLoader
			from: ETLObjectHeaderTest oneWordHeaderData)
			parseHeader.
	self
		assert: ETLObjectHeaderTest twoWordHeader
		equals: (ETLSegmentLoader
			from: ETLObjectHeaderTest twoWordHeaderData)
			parseHeader.
	self
		assert: ETLObjectHeaderTest threeWordHeader
		equals: (ETLSegmentLoader
			from: ETLObjectHeaderTest threeWordHeaderData)
			parseHeader.	