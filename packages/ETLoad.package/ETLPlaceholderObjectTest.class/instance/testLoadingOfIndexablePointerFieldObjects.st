testing
testLoadingOfIndexablePointerFieldObjects
	| header placeholder oopMap |
	
	header := ETLTestData oneWordHeader copy
		objectSizeInWords: 2;
		objectFormat: 2;
		yourself.
	"85 = binary SmallInteger representation of 42"
	placeholder := (ETLPlaceholderObject newFrom: header and: (ReadStream on: { 85 }))
		objectClass: Array;
		yourself.
	oopMap := ETLOopMap
		newFromInternalObjects: Dictionary new
		andOutPointers: { }.
	placeholder loadUsing: oopMap.
	self assert: { 42 } equals: placeholder.