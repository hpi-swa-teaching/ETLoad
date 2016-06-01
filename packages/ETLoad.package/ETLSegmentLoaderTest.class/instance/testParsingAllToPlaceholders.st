testing
testParsingAllToPlaceholders
	| loader placeholderMap |
	
	loader := ETLSegmentLoader from: ETLTestData objectSetData.
	placeholderMap := loader parseAllToPlaceholders.
	
	self 
		assert: ETLTestData objectSetHeaders asBag
		equals: (placeholderMap values collect: [ :each | each header. ]) asBag.
	self 
		assert: ETLTestData objectSetContents asBag
		equals: (placeholderMap values collect: [ :each | each bodyStream upToEnd asArray. ]) asBag.
	self assert: ETLTestData objectSetOops asBag equals: placeholderMap keys asBag.
	self assert: loader stream atEnd.
	