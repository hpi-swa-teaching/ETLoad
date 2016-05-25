instance creation
parseFrom: wordArray
	"Parses an object header from the given header words."
	(wordArray size = 1)
		ifTrue: [ ^ self parseFromBaseHeader: (wordArray at: 1). ].
	(wordArray size = 2)
		ifTrue: [ ^ self parseFromBaseHeader: (wordArray at: 2)
					    andClassHeader: (wordArray at: 1). ].
	(wordArray size = 3)
		ifTrue: [ ^ self parseFromBaseHeader: (wordArray at: 3)
					    andClassHeader: (wordArray at: 2)
					    andSizeHeader: (wordArray at: 1). ].
	Exception signal: 'Invalid number of header words'.
