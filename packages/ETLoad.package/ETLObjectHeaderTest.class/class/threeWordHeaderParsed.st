constants
threeWordHeaderParsed
	"Expected result of parsing the three word example header."

	^ ETLObjectHeader new
		objectHash: 2r101010101010;
		compactClassIndex: nil;
		classOop: 2r01010101010101010101010101010100;
		objectFormat: 2r0010;
		sizeInWords: 2r11001100;
		yourself.