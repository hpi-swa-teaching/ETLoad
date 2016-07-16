testing
expectedFailures
	^ #(HelloWorldStr Morph FatBitsPaint FlexMorph BouncingAtomsMorph Nil) collect: [ :test | self class testMethodPrefix , test. ].