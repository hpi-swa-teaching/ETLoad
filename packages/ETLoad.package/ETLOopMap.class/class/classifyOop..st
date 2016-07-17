oop-classification
classifyOop: anOop
	"Classifies an oop into one of four categories: #segmentInternalPointer, #outPointer, #smallInteger, #invalid."
	
	^ ((anOop bitAnd: 1) = 1) 
		ifTrue: [ #smallInteger. ]
		ifFalse: [ (anOop isDivisibleBy: ETLSegmentLoader segmentWordSize) 
			ifTrue: [ anOop > self outPointerBaseAddress
				ifTrue: [ #outPointer. ] 
				ifFalse: [ #segmentInternalPointer. ]. ]
			ifFalse: [ #invalid. ]. ].