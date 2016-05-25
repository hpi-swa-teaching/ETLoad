comparing
= anObjectHeader
	"Compares two object headers for equality."
	
	^ self classOop = anObjectHeader classOop
		and: [ self compactClassIndex = anObjectHeader compactClassIndex. ]
		and: [ self objectFormat = anObjectHeader objectFormat. ]
		and: [ self objectHash = anObjectHeader objectHash. ]
		and: [ self sizeInWords = anObjectHeader sizeInWords. ].