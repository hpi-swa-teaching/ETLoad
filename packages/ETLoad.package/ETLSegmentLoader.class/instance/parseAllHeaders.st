parsing
parseAllHeaders
	"Parses all object headers from the current position until no more data is available."
	
	^ Array streamContents: [ :collectionStream |
		[ self stream atEnd ] whileFalse: [ | header |
			header := self parseHeader.
			self stream skip: header sizeInWords - 1.
			collectionStream nextPut: header. ]. ].