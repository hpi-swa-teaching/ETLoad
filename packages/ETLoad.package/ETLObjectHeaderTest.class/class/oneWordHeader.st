constants
oneWordHeader
	"Example one word header."

	^ ETLObjectHeader new
		objectHash: 2r101010101010;
		compactClassIndex: 2r11011;
		classOop: nil;
		objectFormat: 2r0010;
		sizeInWords: 2r101010;
		yourself.