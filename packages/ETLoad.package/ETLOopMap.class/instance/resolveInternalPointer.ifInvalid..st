resolving
resolveInternalPointer: anOop ifInvalid: aBlock
	"Resolves the internal object an oop refers to.
	
	If the oop is invalid, answers the result of executing aBlock."
	
	^ self internalObjects
		at: anOop
		ifAbsent: aBlock.
