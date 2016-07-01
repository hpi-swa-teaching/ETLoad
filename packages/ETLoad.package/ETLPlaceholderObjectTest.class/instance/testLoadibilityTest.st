testing
testLoadibilityTest
	| placeholder |
	
	placeholder := ETLPlaceholderObject
		newFrom: ETLTestData oneWordHeader
		and: (ReadStream on: { }).
	placeholder objectClass: placeholder.
	self deny: placeholder isLoadable.
	
	placeholder objectClass: Integer.
	self assert: placeholder isLoadable.