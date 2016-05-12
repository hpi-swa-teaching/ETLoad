compact classes
compactIndexAt: ind
	| word |
	"Look in this header word in the segment and find it's compact class index. *** Warning: When class ObjectMemory change, be sure to change it here. *** "

	((word := segment at: ind) bitAnd: 3) = 2 ifTrue: [^ 0].  "free block"
	^ (word >> 12) bitAnd: 16r1F 	"Compact Class field of header word"

