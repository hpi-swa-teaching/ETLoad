testing
testInstanceCreationWithNewFromAnd
	| placeholderObject stream |

	stream := ReadStream on: { }.
	placeholderObject := ETLPlaceholderObject 
		newFrom: ETLObjectHeaderTest oneWordHeader 
		and: stream.
		
	self assert: ETLObjectHeaderTest oneWordHeader equals: placeholderObject header.
	self assert: stream equals: placeholderObject bodyStream.
	