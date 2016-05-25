instance creation
parseFromBaseHeader: baseWord
	"Parses an object header from a single word base header."
	
	^ self new
		sizeInWords: ((baseWord >> 2) bitAnd: 2r111111);
		objectFormat: ((baseWord >> 8) bitAnd: 2r1111);
		compactClassIndex: ((baseWord >> 12) bitAnd: 2r11111);
		objectHash: ((baseWord >> 17) bitAnd: 2r111111111111);
		yourself.
