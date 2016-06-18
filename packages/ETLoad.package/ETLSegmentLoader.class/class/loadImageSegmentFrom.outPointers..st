loading
loadImageSegmentFrom: segmentWordArray outPointers: outPointerArray
	| placeholders |
	
	placeholders := (self from: segmentWordArray)
		skipVersion;
		parseAllToPlaceholders.
		
	placeholderCallback ifNotNil: [ placeholderCallback value: placeholders. ].
		
	self error: 'the image segment contained objects which cannot yet be loaded.'.
		