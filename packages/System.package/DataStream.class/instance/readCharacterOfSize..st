write and read
readCharacterOfSize: instSize
	| refPosn val |
	self assert: instSize = 1.
	refPosn := self getCurrentReference.
	self setCurrentReference: refPosn.
	val := self next.
	^ Character value: val.
