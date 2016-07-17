testing
testInstanceCreationWithNewFromAnd
	| placeholderObject stream |

	stream := ReadStream on: { }.
	placeholderObject := ETLPlaceholderObject 
		newFrom: ETLTestData oneWordHeader 
		and: stream.

	self assert: ETLTestData oneWordHeader equals: placeholderObject header.
	self assert: stream equals: placeholderObject bodyStream.