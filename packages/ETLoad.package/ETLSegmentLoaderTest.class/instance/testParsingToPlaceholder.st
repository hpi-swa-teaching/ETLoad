testing
testParsingToPlaceholder
	| loader data content placeholder |
	
	content := 1 to: ETLObjectHeaderTest oneWordHeader objectSizeInWords - 1.
	data := ETLObjectHeaderTest oneWordHeaderData , content.
	loader := ETLSegmentLoader from: data.
	placeholder := loader parseToPlaceholder.
	
	self assert: ETLObjectHeaderTest oneWordHeader equals: placeholder header.
	self assert: content equals: placeholder bodyStream upToEnd. 
	self assert: loader stream atEnd. 
	