loading
loadIndexablePointerFieldsObjectUsing: oopMap
	| fieldCount object |

	"Object size includes base header word"
	fieldCount := self header bodySizeInWords.
	object := self objectClass basicNew: fieldCount.
	1 to: fieldCount do: [ :fieldNumber |
		object
			instVarAt: fieldNumber
			put: (self resolve: self bodyStream next using: oopMap). ].
	^ object.