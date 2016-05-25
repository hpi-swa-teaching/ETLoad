testing
testCreationFromTwoWords
	| words header expected |
	
	words := { 2r01010101010101010101010101010101 . 2r00010101010101011011001010101001 }.
	expected := ETLObjectHeader new
		objectHash: 2r101010101010;
		compactClassIndex: nil;
		classOop: 2r01010101010101010101010101010100;
		objectFormat: 2r0010;
		sizeInWords: 2r101010;
		yourself.
	header := ETLObjectHeader parseFrom: words.
	self assert: expected equals: header.