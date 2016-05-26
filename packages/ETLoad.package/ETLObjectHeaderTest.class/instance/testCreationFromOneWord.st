testing
testCreationFromOneWord
	| word header |
	
	word := 2r00010101010101011011001010101011.
	header := ETLObjectHeader parseFrom: { word }.
	self assert: 2r101010101010 equals: header objectHash.
	self assert: 2r11011 equals: header compactClassIndex.
	self assert: nil equals: header classOop.
	self assert: 2r0010 equals: header objectFormat.
	self assert: 2r101010 equals: header sizeInWords.