testing
expectedFailures
	^ #(HelloWorldStr Morph FatBitsPaint FlexMorph BouncingAtomsMorph Nil ColorBlue ColorWhite ColorBlack True False TrueClass FalseClass) collect: [ :test | self class testMethodPrefix , test. ].