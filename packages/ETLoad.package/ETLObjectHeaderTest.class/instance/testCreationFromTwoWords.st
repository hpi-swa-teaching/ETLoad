testing
testCreationFromTwoWords
	| parsed |

	parsed := ETLObjectHeader parseFrom: self class twoWordHeaderData.
	self assert: self class twoWordHeader equals: parsed.