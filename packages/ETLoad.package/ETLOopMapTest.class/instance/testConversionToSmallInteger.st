testing
testConversionToSmallInteger
	self assert: 2r101010 equals: (ETLOopMap toSmallInteger: 2r1010101).
	self assert: -1 equals: (ETLOopMap toSmallInteger: 16rFFFFFFFF).
	self assert: -16r40000000 equals: (ETLOopMap toSmallInteger: 16r80000001).
	self assert: 16r3FFFFFFF equals: (ETLOopMap toSmallInteger: 16r7FFFFFFF).
	self assert: 0 equals: (ETLOopMap toSmallInteger: 16r00000001).
	self assert: 1 equals: (ETLOopMap toSmallInteger: 16r00000002).
	self assert: -2 equals: (ETLOopMap toSmallInteger: 16rFFFFFFFD).
	self assert: -16r3FFFFFFF equals: (ETLOopMap toSmallInteger: 16r80000003).
	self assert: 16r3FFFFFFE equals: (ETLOopMap toSmallInteger: 16r7FFFFFFD).
