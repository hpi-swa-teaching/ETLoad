testing
testCreationFromThreeWords
	| parsed |

	parsed := ETLObjectHeader parseFrom: ETLTestData threeWordHeaderData.
	self assert: ETLTestData threeWordHeader equals: parsed.