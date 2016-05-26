testing
testCreationFromOneWord
	| parsed |
	
	parsed := ETLObjectHeader parseFrom: self class oneWordHeaderData.
	self assert: self class oneWordHeader equals: parsed.