testing
testDeterminationOfHeaderSize
	"3 words"
	self assert: 3 equals: (ETLObjectHeader determineHeaderSizeFrom: 0).
	self assert: 3 equals: (ETLObjectHeader determineHeaderSizeFrom: (16rFFFFFFFF - 3)).
	"2 words"
	self assert: 2 equals: (ETLObjectHeader determineHeaderSizeFrom: 1).
	self assert: 2 equals: (ETLObjectHeader determineHeaderSizeFrom: (16rFFFFFFFF - 2)).
	"1 word"
	self assert: 1 equals: (ETLObjectHeader determineHeaderSizeFrom: 3).
	self assert: 1 equals: (ETLObjectHeader determineHeaderSizeFrom: 16rFFFFFFFF).
	"invalid header"
	self should: [ ETLObjectHeader determineHeaderSizeFrom: 2 ]  raise: ETLInvalidObjectHeaderSize.
	self should: [ ETLObjectHeader determineHeaderSizeFrom: 16rFFFFFFFF - 1 ]  raise: ETLInvalidObjectHeaderSize.