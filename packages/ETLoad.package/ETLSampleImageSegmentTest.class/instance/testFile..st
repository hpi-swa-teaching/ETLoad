testing
testFile: aFile
	| reference |
	
	reference := ETLProjectLoadHelper loadSampleImageSegmentReference: aFile.
	
	[ ETLSegmentLoader do: [ ETLProjectLoadHelper loadSampleImageSegment: aFile. ]
			withLoadResultDo: [ :result | [ self assert: result equals: reference. ] ensure: [
					result select: [ :obj | obj isKindOf: Morph. ] thenDo: [
						:morph | morph dismissMorph. ]. ]. ]. ] ensure: [
		reference select: [ :obj | obj isKindOf: Morph. ] thenDo: [ :morph | morph dismissMorph. ]. ].