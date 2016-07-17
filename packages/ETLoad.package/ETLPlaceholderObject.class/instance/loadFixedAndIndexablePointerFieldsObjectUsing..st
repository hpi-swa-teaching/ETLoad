loading
loadFixedAndIndexablePointerFieldsObjectUsing: oopMap
	"Loads an object containing instance variables and an array part.
	 Also used for the weak reference variant, because the instance creation is the same"
	| fieldCount object |
	
	"Object size includes base header word"
	fieldCount := self header objectSizeInWords - 1.
	object := self objectClass basicNew: fieldCount - self objectClass instVarNames size.
	1 to: fieldCount do: [ :i |
		object
			instVarAt: i
			put: (self resolve: self bodyStream next using: oopMap). ].
	^ object.