testing
testConversionToSmallInteger

	self assert: 2r101010 equals: (ETLOopMap toSmallInteger: 2r1010101).
	self assert: -1 equals: (ETLOopMap toSmallInteger: 16rFFFFFFFF).
	self assert: -16r40000000 equals: (ETLOopMap toSmallInteger: 16r80000001).
	self assert: 16r3FFFFFFF equals: (ETLOopMap toSmallInteger: 16r7FFFFFFF).
