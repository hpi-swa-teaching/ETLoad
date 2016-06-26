testing
testPlaceholderIdentification
	self assert: ETLPlaceholderObject new isETLPlaceholder.
	self deny: Object new isETLPlaceholder.
	self deny: 1 isETLPlaceholder.
	self deny: 'abc' isETLPlaceholder.