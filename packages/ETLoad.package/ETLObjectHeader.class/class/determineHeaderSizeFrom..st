analysis
determineHeaderSizeFrom: firstWord
	"Determines the size of an object header in words from its first header word."
	
	^ self headerTypesToHeaderSizes
		at: (firstWord bitAnd: self headerTypeBitMask)
		ifAbsent: [ ETLInvalidObjectHeaderSize signal. ].
		