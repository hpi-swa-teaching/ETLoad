testing
testCreationFromTwoWords
	| parsed |

	parsed := ETLObjectHeader parseFrom: self class twoWordHeader.
	self assert: self class twoWordHeaderParsed equals: parsed.