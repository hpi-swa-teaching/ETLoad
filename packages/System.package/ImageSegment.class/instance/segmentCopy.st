read/write segment
segmentCopy
	"This operation will install a copy of the segment in memory, and return a copy of the array of roots.  The effect is to perform a deep copy of the original structure.  Note that installation destroys the segment, so it must be copied before doing the operation."

	state = #activeCopy ifFalse: [self errorWrongState].
	^ self loadSegmentFrom: segment copy outPointers: outPointers