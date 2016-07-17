loading
loadIndexableWordFieldsObject
	| fieldCount object |
	
	"Object size includes base header word"
	fieldCount := self header objectSizeInWords - 1.
	object := self objectClass basicNew: fieldCount.
	1 to: fieldCount do: [ :i |
		object instVarAt: i put: self bodyStream next. ].
	^ object.