testing
testFile: aFile
	| reference |

	reference := ETLProjectLoadHelper loadSampleImageSegmentReference: aFile.
	"reference is either
		a) a block which validates the loaded result and takes this test case and the result as an argument or
		b) an array with the expected data (so that `reference = result` returns `true`)"

	"Mophs cannot be reliably compared for equality, they always require that reference is block.
	 Since we don't want these morphs staying around during tests, enusre they are dismissed."
	ETLSegmentLoader do: [ ETLProjectLoadHelper loadSampleImageSegment: aFile. ]
		withLoadResultDo: [ :result | reference isBlock
			ifTrue: [ self class after: [ reference value: self value: result. ] dismissMorphsIn: result. ]
			ifFalse: [ self assert: reference equals: result. ]. ].