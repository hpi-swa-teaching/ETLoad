constants
objectsWithDummyContentData
	"Data for several objects with dummy content and valid headers.
	 Should only be used for header parsing tests."
	
	^ WordArrayForSegment
		newFrom: (self oneWordHeaderData,
				    (0 to: self oneWordHeader objectSizeInWords - 2),
				    self twoWordHeaderData,
				    (0 to: self twoWordHeader objectSizeInWords - 2),
				    self threeWordHeaderData,
				    (0 to: self threeWordHeader objectSizeInWords - 2)).