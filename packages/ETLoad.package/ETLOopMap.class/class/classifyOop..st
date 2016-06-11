oop-classification
classifyOop: anOop
	"Classifies an oop into one of four categories: #segmentInternalPointer, #outPointer, #smallInteger, #invalid."
	
	^ ((anOop bitAnd: 1) = 1) 
		ifTrue: [ #smallInteger. ]
		ifFalse: [ (anOop isDivisibleBy: 4) 
			ifTrue: [ anOop > 16r80000000 
				ifTrue: [ #outPointer. ] 
				ifFalse: [ #segmentInternalPointer. ]. ]
			ifFalse: [ #invalid. ]. ].