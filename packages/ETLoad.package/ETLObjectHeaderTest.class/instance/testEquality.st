testing
testEquality
	| header changedHash changedCCIndex changedClassOop changedFormat changedSize |
	
	header := ETLObjectHeader new
		objectHash: 42;
		compactClassIndex: nil;
		classOop: 123456789;
		objectFormat: 2r0010;
		objectSizeInWords: 31;
		yourself.
	self assert: header equals: header copy.
	
	changedHash := header copy
		objectHash: 100;
		yourself.
	self deny: (header = changedHash).
	
	changedCCIndex := header copy
		compactClassIndex: 12;
		yourself.
	self deny: (header = changedCCIndex).
	
	changedClassOop := header copy
		classOop: 1;
		yourself.
	self deny: (header = changedClassOop).
	
	changedFormat := header copy
		objectFormat: 11;
		yourself.
	self deny: (header = changedFormat).
	
	changedSize := header copy
		objectSizeInWords: 1;
		yourself.
	self deny: (header = changedSize).