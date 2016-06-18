resolving
resolve: anOop ifInvalid: aBlock
	"Resolve an oop based on its type."
	
	^ (self class classifyOop: anOop) caseOf: {
		[ #segmentInternalPointer ] -> [ self resolveInternalPointer: anOop ifInvalid: aBlock ] .
		[ #outPointer ] -> [ self resolveOutPointer: anOop ifInvalid: aBlock ] .
		[ #smallInteger ] -> [ self class toSmallInteger: anOop ]
	} otherwise: aBlock.