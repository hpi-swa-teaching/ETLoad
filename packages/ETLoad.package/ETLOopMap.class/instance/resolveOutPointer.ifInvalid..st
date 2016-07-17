resolving
resolveOutPointer: anOop ifInvalid: aBlock
	"Resolves the given out pointer oop to the object it references.
	
	If the out pointer is out of range, answer the result of executing the given block."
	
	^ self outPointers
		at: (anOop - self class outPointerBaseAddress) / ETLSegmentLoader segmentWordSize 
		ifAbsent: aBlock.