loading
loadFixedPointerFieldsObjectUsing: oopMap
	| fieldCount object |
	
	"Object size includes base header word"
	fieldCount := self header objectSizeInWords - 1.
	
	fieldCount ~= self objectClass instVarNames size
		ifTrue: [ ETLIncompatibleObjectError
			signal: 'Incompatible object: differing variable count'. ].
	
	object := self objectClass basicNew.
	1 to: fieldCount do: [ :i |
		object
			instVarAt: i
			put: (self resolve: self bodyStream next using: oopMap). ].
	^ object.