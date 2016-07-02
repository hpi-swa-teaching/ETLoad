integration-testing
testLoadingImageSegmentContainingSingleNumber
	ETLSegmentLoader
		do: [ ETLProjectLoadHelper loadSampleImageSegment: '42.ims'. ]
		withLoadResultDo: [ :result |
			self assert: { 42 } equals: result. ].