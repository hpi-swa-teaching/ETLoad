testing
testCreationFromTwoWords
	| words header |
	
	words := { 2r01010101010101010101010101010101 . 2r00010101010101011011001010101001 }.
	header := ETLObjectHeader parseFrom: words.
	self assert: 2r101010101010 equals: header objectHash.
	self assert: nil equals: header compactClassIndex.
	self assert: 2r01010101010101010101010101010100 equals: header classOop.
	self assert: 2r0010 equals: header objectFormat.
	self assert: 2r101010 equals: header sizeInWords.