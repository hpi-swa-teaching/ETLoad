testing
testParsingToPlaceholderThreeWordHeader
	| loader data content association |

	content := 1 to: ETLTestData threeWordHeader bodySizeInWords.
	data := ETLTestData threeWordHeaderData , content.
	loader := ETLSegmentLoader newFor: data.
	association := loader parseToPlaceholder.

	self assert: ETLTestData threeWordHeader equals: association value header.
	self assert: content equals: association value bodyStream upToEnd. 
	self assert: 12 equals: association key.
	self assert: loader stream atEnd.