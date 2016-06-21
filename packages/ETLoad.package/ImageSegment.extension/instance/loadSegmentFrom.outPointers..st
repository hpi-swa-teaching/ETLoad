*ETLoad-override
loadSegmentFrom: segmentWordArray outPointers: outPointerArray
	| backup returnValue |
	
	backup := segmentWordArray copy. "Create a copy of the segmentWordArray since 'If [#primLoadSegmentFrom:outPointers:] should fail, it will have destroyed the contents of the segment wordArray".
	
	returnValue := self primLoadSegmentFrom: segmentWordArray outPointers: outPointerArray.
	
	returnValue 
		ifNil: [ "failure returns nil"
			^ self loadOldSegmentFrom: backup outPointers: outPointerArray. ]
		ifNotNil: [ "successful completion returns the array of roots"
			^ returnValue. ].