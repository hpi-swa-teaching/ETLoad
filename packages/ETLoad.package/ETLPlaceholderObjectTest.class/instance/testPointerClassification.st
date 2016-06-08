testing
testPointerClassification

	self assert: #outPointer equals: (ETLPlaceholderObject classifyOop: 16r80000004).
	self assert: #smallInteger equals: (ETLPlaceholderObject classifyOop: 16r80000005).
	self assert: #smallInteger equals: (ETLPlaceholderObject classifyOop: 16r00000003).
	self assert: #segmentInternalPointer equals: (ETLPlaceholderObject classifyOop: 16r00000008).
	self assert: #invalid equals: (ETLPlaceholderObject classifyOop: 16r80000006).