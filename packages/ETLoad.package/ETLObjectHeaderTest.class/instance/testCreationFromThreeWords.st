testing
testCreationFromThreeWords
	| parsed |
	
	parsed := ETLObjectHeader parseFrom: self class threeWordHeader.
	self assert: self class threeWordHeaderParsed equals: parsed.