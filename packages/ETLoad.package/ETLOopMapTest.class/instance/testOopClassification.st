testing
testOopClassification

	self assert: #outPointer equals: (ETLOopMap classifyOop: 16r80000004).
	self assert: #smallInteger equals: (ETLOopMap classifyOop: 16r80000005).
	self assert: #smallInteger equals: (ETLOopMap classifyOop: 16r00000003).
	self assert: #segmentInternalPointer equals: (ETLOopMap classifyOop: 16r00000008).
	self assert: #invalid equals: (ETLOopMap classifyOop: 16r80000006).