testing
testCreationFromTwoWords
	| parsed |

	parsed := ETLObjectHeader parseFrom: ETLTestData twoWordHeaderData.
	self assert: ETLTestData twoWordHeader equals: parsed.