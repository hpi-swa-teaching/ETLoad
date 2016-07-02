testing
testGettingLoadResult
	ETLSegmentLoader
		do: [ ETLSegmentLoader
			loadImageSegmentFrom: ETLTestData emptyImageSegmentData
			outPointers: { } ]
		withLoadResultDo: [ :result | self assert: nil equals: result. ].