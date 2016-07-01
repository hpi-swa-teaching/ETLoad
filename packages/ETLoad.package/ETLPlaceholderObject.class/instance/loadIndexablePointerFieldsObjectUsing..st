loading
loadIndexablePointerFieldsObjectUsing: oopMap
	| fieldCount object |
	
	"Object size includes base header word"
	fieldCount := self header objectSizeInWords - 1.
	object := self objectClass basicNew: fieldCount.
	1 to: fieldCount do: [ :i |
		object
			instVarAt: i
			put: (oopMap resolve: self bodyStream next ifInvalid: [ nil. ]). ].
	^ object.