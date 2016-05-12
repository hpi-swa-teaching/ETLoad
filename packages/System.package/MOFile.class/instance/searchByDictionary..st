public
searchByDictionary: aString
	| index |
	index := translations at: aString ifAbsent: [^nil].
	^self translatedString: index
	
