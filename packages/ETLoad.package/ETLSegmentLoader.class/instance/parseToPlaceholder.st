parsing
parseToPlaceholder
	"Parses the object at the current position of the stream to a new placeholder object."
	| header stream |
	
	header := self parseHeader.
	stream := ReadStream 
		on: self data 
		from: self stream position + 1
		to: self stream position + header objectSizeInWords.
		
	self stream skip: header objectSizeInWords - 1.
	
	^ ETLPlaceholderObject newFrom: header and: stream.
	