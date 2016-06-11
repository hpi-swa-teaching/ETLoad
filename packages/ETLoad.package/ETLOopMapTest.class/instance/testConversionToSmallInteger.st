testing
testConversionToSmallInteger

	self assert: 2r101010 equals: (ETLOopMap toSmallInteger: 2r1010101).
	self assert: 16r7FFFFFFF equals: (ETLOopMap toSmallInteger: 16rFFFFFFFF).
