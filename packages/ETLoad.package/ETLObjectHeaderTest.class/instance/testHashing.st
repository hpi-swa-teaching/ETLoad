testing
testHashing
	| header |
	
	header := ETLObjectHeader new
		objectHash: 42;
		compactClassIndex: nil;
		classOop: 123456789;
		objectFormat: 2r0010;
		objectSizeInWords: 31;
		yourself.
	self assert: header hash equals: header copy hash.