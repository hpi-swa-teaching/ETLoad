instance creation
parseFrom: wordArray
	"Parses an object header from the given header words."
	^ wordArray size caseOf: {
		[1] -> [ self parseFromBaseHeader: (wordArray at: 1). ] .
		[2] -> [ self parseFromBaseHeader: (wordArray at: 2)
		                   andClassHeader: (wordArray at: 1). ] .
		[3] -> [ self parseFromBaseHeader: (wordArray at: 3)
			  		 andClassHeader: (wordArray at: 2)
		 			 andSizeHeader: (wordArray at: 1). ] }.