testing
expectedFailures
	^ #(HelloWorldStr Morph FatBitsPaint FlexMorph BouncingAtomsMorph Nil ColorBlue ColorWhite ColorBlack) collect: [ :test | self class testMethodPrefix , test. ].