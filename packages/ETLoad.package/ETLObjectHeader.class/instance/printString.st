printing
printString
	^ 'ObjectHeader (format: ', self objectFormat, ', object size: ', self objectSizeInWords, ' words)'.