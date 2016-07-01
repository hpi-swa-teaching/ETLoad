loading
loadUsing: oopMap
	"Loads the receiver into a real object becoming the receiver."
	| object |
	
	(self class is: self header objectFormat compatibleWith: self objectClass instSpec)
		ifFalse: [ ETLIncompatibleObjectError signal: 'Incompatible object formats'. ].
		
	object := self header objectFormat caseOf: {
		[ 2 ] -> [ self loadIndexablePointerFieldsObjectUsing: oopMap. ]
	} otherwise: [ ETLIncompatibleObjectError signal: 'Not loadable/corrupt object'. ].
	self becomeForward: object.