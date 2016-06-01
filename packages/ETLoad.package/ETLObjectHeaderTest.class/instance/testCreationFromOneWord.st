testing
testCreationFromOneWord
	| parsed |
	
	parsed := ETLObjectHeader parseFrom: ETLTestData oneWordHeaderData.
	self assert: ETLTestData oneWordHeader equals: parsed.