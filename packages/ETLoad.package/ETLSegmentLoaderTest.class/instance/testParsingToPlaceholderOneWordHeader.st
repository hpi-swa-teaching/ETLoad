testing
testParsingToPlaceholderOneWordHeader
	| loader data content association |
	
	content := 1 to: ETLTestData oneWordHeader objectSizeInWords - 1.
	data := ETLTestData oneWordHeaderData , content.
	loader := ETLSegmentLoader newFor: data.
	association := loader parseToPlaceholder.
	
	self assert: ETLTestData oneWordHeader equals: association value header.
	self assert: content equals: association value bodyStream upToEnd. 
	self assert: 4 equals: association key.
	self assert: loader stream atEnd.
	