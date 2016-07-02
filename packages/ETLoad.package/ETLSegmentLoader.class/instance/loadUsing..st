loading
loadUsing: outPointers
	"Loads the segment content and returns the root object."	
	| placeholderMap oopMap |
	
	placeholderMap := self
		skipVersion;
		parseAllToPlaceholders.

	oopMap := ETLOopMap
		newFromInternalObjects: placeholderMap
		andOutPointers: outPointers.
		
	self loadFromPlaceholders: placeholderMap values usingMap: oopMap.
	
	"4 = oop to the first object in an image segment (bytes 0-3 = header)"
	^ placeholderMap at: 4 ifAbsent: [ nil. ].