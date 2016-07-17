loading
loadIndexableByteFieldsObject
	| wordCount fieldCount object words |
	
	"Object size includes base header word"
	wordCount := self header objectSizeInWords - 1.
	
	"Last 2 bits in object format specify exact size in bytes"
	fieldCount := wordCount * 4 - self header objectFormat + 8.
	words := self bodyStream upToEnd.
	
	object := self objectClass basicNew: fieldCount.
	1 to: fieldCount do: [ :i | | byte |
		byte := (words at: (i - 1) // 4 + 1) digitAt: (i - 1) \\ 4 + 1.
		object instVarAt: i put: byte. ].
	^ object.