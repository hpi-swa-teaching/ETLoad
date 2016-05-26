instance creation
parseFromBaseHeader: baseWord andClassHeader: classWord andSizeHeader: sizeWord
	"Parses an object header from a base header plus additional class oop and size headers."

	^ self new
		sizeInWords: (sizeWord >> 2);
		objectFormat: ((baseWord >> 8) bitAnd: 16r0F);
		classOop: (classWord bitAnd: 16rFFFFFFFC);
		objectHash: ((baseWord >> 17) bitAnd: 16r0FFF);
		yourself.