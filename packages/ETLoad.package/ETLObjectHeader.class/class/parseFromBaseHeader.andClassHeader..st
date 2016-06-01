instance creation
parseFromBaseHeader: baseWord andClassHeader: classWord
	"Parses an object header from a base header and an additional class oop header."

	^ self new
		objectSizeInWords: ((baseWord >> 2) bitAnd: 2r111111);
		objectFormat: ((baseWord >> 8) bitAnd: 2r1111);
		classOop: (classWord bitAnd: 16rFFFFFFFC);
		objectHash: ((baseWord >> 17) bitAnd: 2r111111111111);
		yourself.