testing
testCreationFromThreeWords
	| words header expected |
	
	words := { 2r11001100110011001100110011001100 .
			     2r01010101010101010101010101010100 .
			     2r00010101010101011011001010101000 }.
	expected := ETLObjectHeader new
		objectHash: 2r101010101010;
		compactClassIndex: nil;
		classOop: 2r01010101010101010101010101010100;
		objectFormat: 2r0010;
		sizeInWords: 2r110011001100110011001100110011;
		yourself.
	header := ETLObjectHeader parseFrom: words.
	self assert: expected equals: header.