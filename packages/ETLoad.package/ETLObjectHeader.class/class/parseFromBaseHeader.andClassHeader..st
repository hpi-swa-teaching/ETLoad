instance creation
parseFromBaseHeader: baseWord andClassHeader: classWord
	"Parses an object header from a base header and an additional class oop header."

	^ self new
		objectSizeInWords: ((baseWord >> 2) bitAnd: 16r3F);
		objectFormat: ((baseWord >> 8) bitAnd: 16r0F);
		classOop: (classWord bitAnd: 16rFFFFFFFC);
		objectHash: ((baseWord >> 17) bitAnd: 16r0FFF);
		yourself.
