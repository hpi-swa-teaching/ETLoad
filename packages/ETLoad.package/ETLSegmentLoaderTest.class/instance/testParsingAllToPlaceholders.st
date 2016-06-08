testing
testParsingAllToPlaceholders
	| loader placeholderMap |
	
	loader := ETLSegmentLoader from: ETLTestData objectSetData.
	placeholderMap := loader parseAllToPlaceholders.
	
	self assert: (placeholderMap associations allSatisfy: [ :association |
		ETLTestData objectSetExpectedPlaceholderVerifiers
			at: association key
			ifPresent: [ :testBlock | testBlock value: association value. ]
			ifAbsent: [ false. ]. ]).
	self assert: loader stream atEnd.
	