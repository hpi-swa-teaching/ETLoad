testing
testCreationFromOneWord
	| parsed |
	
	parsed := ETLObjectHeader parseFrom: self class oneWordHeader.
	self assert: self class oneWordHeaderParsed equals: parsed.