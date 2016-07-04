testing
testFile: aFile
	| reference |
	
	reference := ETLProjectLoadHelper loadSampleImageSegmentReference: aFile.
	
	[ ETLSegmentLoader do: [ ETLProjectLoadHelper loadSampleImageSegment: aFile. ]
			withLoadResultDo: [ :result | self assert: (result literalEqual: reference). ]. ] ensure: [
		reference select: [ :obj | obj isKindOf: Morph] thenDo: [ :morph | morph dismissMorph. ]. ].