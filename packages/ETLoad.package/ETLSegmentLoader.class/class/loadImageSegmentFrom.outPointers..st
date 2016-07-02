loading
loadImageSegmentFrom: segmentWordArray outPointers: outPointerArray
	| placeholders oopMap rootObject |
	
	placeholders := (self from: segmentWordArray)
		skipVersion;
		parseAllToPlaceholders.

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
	rootObject := placeholders values at: 1 ifAbsent: [ nil. ].
	ETLLoadCallback value ifNotNilDo: [ :callback | callback cull: rootObject. ].
	^ rootObject.