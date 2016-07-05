helpers
withIncompatibleFormatPairsDo: aBlock
	0 to: 15 do: [ :s3Format | | compatibleRange |
		compatibleRange := self objectFormatCompatibilityTable
			at: s3Format
			ifAbsent: [ Array new. ].
		0 to: 31 do: [ :s5Format |
			(compatibleRange includes: s5Format)
				ifFalse: [ aBlock value: s3Format value: s5Format. ]. ]. ].