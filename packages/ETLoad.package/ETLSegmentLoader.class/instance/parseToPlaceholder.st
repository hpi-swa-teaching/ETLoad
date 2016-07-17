parsing
parseToPlaceholder
	"Parses the object at the current position of the stream to a new placeholder object."
	| header oop bodyStream |

	header := self parseHeader.
	bodyStream := ReadStream 
		on: self data 
		from: self stream position + 1
		to: self stream position + header bodySizeInWords.

	oop := self stream position * ETLSegmentLoader segmentWordSize.		
	self stream skip: header bodySizeInWords.
	
	^ oop -> (ETLPlaceholderObject newFrom: header and: bodyStream).
	