resolving
resolveOutPointer: anOop ifInvalid: aBlock
	"Resolves the given out pointer oop to the object it references.
	
	If the out pointer is out of range, answer the result of executing the given block."
	
	^ self outPointers
		at: (anOop - 16r80000000) / 4
		ifAbsent: aBlock.