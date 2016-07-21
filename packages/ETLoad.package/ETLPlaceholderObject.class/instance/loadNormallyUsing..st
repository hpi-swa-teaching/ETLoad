loading
loadNormallyUsing: oopMap
	(self class isObjectFormat: self header objectFormat
			    compatibleWith: self objectClass instSpec)
		ifFalse: [ ETLIncompatibleObjectError signal: 'Incompatible object formats'. ].
		
	^ self header objectFormat caseOf: {
		[ 0 ] -> [ self loadEmptyObject. ] .
		[ 1 ] -> [ self loadFixedPointerFieldsObjectUsing: oopMap. ] .
		[ 2 ] -> [ self loadIndexablePointerFieldsObjectUsing: oopMap. ] .
		[ 3 ] -> [ self loadFixedAndIndexablePointerFieldsObjectUsing: oopMap. ] .
		[ 4 ] -> [ self loadFixedAndIndexablePointerFieldsObjectUsing: oopMap. ] .
		[ 6 ] -> [ self loadIndexableWordFieldsObject. ] .
		[ 8 ] -> [ self loadIndexableByteFieldsObject.  ] .
		[ 9 ] -> [ self loadIndexableByteFieldsObject.  ] .
		[ 10 ] -> [ self loadIndexableByteFieldsObject.  ] .
		[ 11 ] -> [ self loadIndexableByteFieldsObject.  ]
	} otherwise: [ ETLIncompatibleObjectError signal: 'Not loadable/corrupt object'. ].