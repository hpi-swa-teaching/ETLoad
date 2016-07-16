testing
expectedFailures
	^ #(HelloWorldStr Morph FatBitsPaint FlexMorph) collect: [ :test | self class testMethodPrefix , test. ].