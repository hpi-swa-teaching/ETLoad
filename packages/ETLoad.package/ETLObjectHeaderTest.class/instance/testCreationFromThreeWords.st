testing
testCreationFromThreeWords
	| parsed |
	
	parsed := ETLObjectHeader parseFrom: self class threeWordHeaderData.
	self assert: self class threeWordHeader equals: parsed.