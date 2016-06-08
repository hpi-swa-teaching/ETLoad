parsing
parseAllToPlaceholders
	"Parses all remaining objects in the stream to a new placeholder object."
	
	^Dictionary newFrom: (OrderedCollection streamContents: [ :dictionaryStream | 
		[self stream atEnd ] whileFalse: [ 
			dictionaryStream 
				nextPut: (self stream position * 4) ->  self parseToPlaceholder. ]. ]).