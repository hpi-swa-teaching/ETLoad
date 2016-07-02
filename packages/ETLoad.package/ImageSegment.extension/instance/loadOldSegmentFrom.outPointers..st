*ETLoad-hook
loadOldSegmentFrom: segmentWordArray outPointers: outPointerArray
	"send when the #loadSegmentFrom:outPointers: primitve fails"
	^ ETLSegmentLoader
		loadImageSegmentFrom: segmentWordArray
		outPointers: outPointerArray.
