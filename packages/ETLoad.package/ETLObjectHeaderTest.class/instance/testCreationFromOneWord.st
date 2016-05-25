testing
testCreationFromOneWord
	| word expected header |
	
	word := 2r00010101010101011011001010101011.
	expected := ETLObjectHeader new
		objectHash: 2r101010101010;
		compactClassIndex: 2r11011;
		classOop: nil;
		objectFormat: 2r0010;
		sizeInWords: 2r101010;
		yourself.
	header := ETLObjectHeader parseFrom: { word }.
	self assert: expected equals: header.