testing
testObjectFormatCompatibilityTesting
	"See 'Object Formats' wiki page for more info."
	
	ETLTestData withCompatibleFormatPairsDo: [ :s3Format :s5Format |
		self assert: (ETLPlaceholderObject
			isObjectFormat: s3Format
			compatibleWith: s5Format). ].
	ETLTestData withIncompatibleFormatPairsDo: [ :s3Format :s5Format | 
		self deny: (ETLPlaceholderObject
			isObjectFormat: s3Format
			compatibleWith: s5Format). ].