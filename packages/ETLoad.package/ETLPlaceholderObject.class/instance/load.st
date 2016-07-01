loading
load
	"Loads the receiver into a real object becoming the receiver."
	
	(self class is: self header objectFormat compatibleWith: self objectClass instSpec)
		ifFalse: [ ETLIncompatibleObjectError signal: 'Incompatible object formats'. ].