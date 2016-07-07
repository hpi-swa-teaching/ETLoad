testing
expectedFailures
	^ #(HelloWorldStr Morph) collect: [ :test | self class testMethodPrefix , test. ].