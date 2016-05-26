testing
testParsingOfAllHeaders
	| loader |
	
	loader := ETLSegmentLoader
		from: ETLObjectHeaderTest objectsWithDummyContentData.
	self
		assert: ETLObjectHeaderTest headersOfObjectsWithDummyContent
		equals:  loader parseAllHeaders.