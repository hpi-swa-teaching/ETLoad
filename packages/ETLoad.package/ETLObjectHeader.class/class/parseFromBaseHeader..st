instance creation
parseFromBaseHeader: baseWord
	"Parses an object header from a single word base header."
	
	^ self new
		sizeInWords: ((baseWord >> 2) bitAnd: 16r3F);
		objectFormat: ((baseWord >> 8) bitAnd: 16r0F);
		compactClassIndex: ((baseWord >> 12) bitAnd: 16r1F);
		objectHash: ((baseWord >> 17) bitAnd: 16r0FFF);
		yourself.
