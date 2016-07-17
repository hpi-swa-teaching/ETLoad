testing
testParsingToPlaceholderTwoWordHeader
	| loader data content association |

	content := 1 to: ETLTestData twoWordHeader bodySizeInWords.
	data := ETLTestData twoWordHeaderData , content.
	loader := ETLSegmentLoader newFor: data.
	association := loader parseToPlaceholder.

	self assert: ETLTestData twoWordHeader equals: association value header.
	self assert: content equals: association value bodyStream upToEnd. 
	self assert: 8 equals: association key.
	self assert: loader stream atEnd.