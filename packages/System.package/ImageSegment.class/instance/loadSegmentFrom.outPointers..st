primitives
loadSegmentFrom: segmentWordArray outPointers: outPointerArray
	| backup ret |
	
	backup := segmentWordArray copy. "Create a copy of the segmentWordArray since 'If [#primLoadSegmentFrom:outPointers:] should fail, it will have destroyed the contents of the segment wordArray".
	
	ret := self primLoadSegmentFrom: segmentWordArray outPointers: outPointerArray.
	
	ret ifNil: [
		"failure returns nil"
		^ self loadOldSegmentFrom: backup outPointers: outPointerArray.
	] ifNotNil: [
		"successful completion returns the array of roots"
		^ ret.
	].
	