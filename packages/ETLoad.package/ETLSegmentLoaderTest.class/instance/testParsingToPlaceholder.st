testing
testParsingToPlaceholder
	| loader data content placeholder |
	
	content := 1 to: ETLTestData oneWordHeader objectSizeInWords - 1.
	data := ETLTestData oneWordHeaderData , content.
	loader := ETLSegmentLoader from: data.
	placeholder := loader parseToPlaceholder.
	
	self assert: ETLTestData oneWordHeader equals: placeholder header.
	self assert: content equals: placeholder bodyStream upToEnd. 
	self assert: loader stream atEnd. 
	