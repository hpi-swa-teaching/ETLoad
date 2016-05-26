constants
headerTypesToHeaderSizes
	"A dictionary mapping from header types to their sizes in words."
	
	^ Dictionary new
		at: self headerTypeShort put: 1;
		at: self headerTypeClass put: 2;
		at: self headerTypeSizeAndClass put: 3;
		yourself.