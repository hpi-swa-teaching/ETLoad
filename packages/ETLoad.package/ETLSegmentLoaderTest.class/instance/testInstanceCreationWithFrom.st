testing
testInstanceCreationWithFrom
	| data |

	data := WordArrayForSegment newFrom: { 1 . 2 . 3 . 4 }.
	self assert: data equals: (ETLSegmentLoader newFor: data) data.