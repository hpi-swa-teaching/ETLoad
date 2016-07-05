testing
testGettingLoadResult
	ETLSegmentLoader
		do: [ ETLSegmentLoader
			loadImageSegmentFrom: ETLTestData emptyImageSegmentData
			outPointers: ETLTestData emptyImageSegmentOutPointers. ]
		withLoadResultDo: [ :result | self assert: { } equals: result. ].