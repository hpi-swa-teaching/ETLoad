testing
expectedFailures
	^ #(HelloWorldStr Morph FatBitsPaint FlexMorph BouncingAtomsMorph) collect: [ :test | self class testMethodPrefix , test. ].