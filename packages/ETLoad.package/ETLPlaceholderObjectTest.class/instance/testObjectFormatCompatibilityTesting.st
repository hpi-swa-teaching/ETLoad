testing
testObjectFormatCompatibilityTesting
	"See 'Object Formats' wiki page for more info."
	|  compatibilityTable |
	
	compatibilityTable := Dictionary
		newFrom: { 0 -> (0 to: 0) .
					1 -> (1 to: 1) .
					2 -> (2 to: 2) .
					3 -> (3 to: 3) .
					6 -> (10 to: 11) .
					8 -> (16 to: 23) .
					9 -> (16 to: 23) .
					10 -> (16 to: 23) .
					11 -> (16 to: 23) .
					12 -> (24 to: 31) .
					13 -> (24 to: 31) .
					14 -> (24 to: 31) .
					15 -> (24 to: 31) }.
	0 to: 15 do: [ :s3Format | | compatibleRange |
		compatibleRange := compatibilityTable at: s3Format ifAbsent: [ Array new. ].
		0 to: 31 do: [ :s5Format | 
			(compatibleRange includes: s5Format)
				ifTrue: [ self assert: (ETLPlaceholderObject is: s3Format compatibleWith: s5Format). ]
				ifFalse: [ self deny: (ETLPlaceholderObject is: s3Format compatibleWith: s5Format). ]. ]. ].