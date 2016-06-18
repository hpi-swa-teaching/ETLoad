interpretation
toSmallInteger: anOop
	"Converts the oop to the small integer it is referencing."
	
	^ (anOop bitAt: 32) = 1
		"Twos complement conversion"
		ifTrue: [ ((anOop >> 1) bitAt: 31 put: 0) - 16r40000000 ] 
		ifFalse: [ anOop >> 1 ]. 