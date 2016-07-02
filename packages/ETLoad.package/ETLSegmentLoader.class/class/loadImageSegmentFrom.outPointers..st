loading
loadImageSegmentFrom: segmentWordArray outPointers: outPointerArray
	| placeholders oopMap |
	
	placeholders := (self from: segmentWordArray)
		skipVersion;
		parseAllToPlaceholders.
		
	placeholderCallback ifNotNil: [ placeholderCallback value: placeholders. ].

	oopMap := ETLOopMap
		newFromInternalObjects: placeholders
		andOutPointers: outPointerArray.
	placeholders valuesDo: [ :placeholder |
		placeholder
			acquireClassFromMap: oopMap
			orCompactClasses: self assumedCompactClasses. ].
	placeholders valuesDo: [ :placeholder |
		placeholder isLoadable ifFalse: [ ETLIncompatibleObjectError
			signal: 'Loading classes is not yet supported'. ].
		placeholder loadUsing: oopMap. ].
	^ placeholders values first.