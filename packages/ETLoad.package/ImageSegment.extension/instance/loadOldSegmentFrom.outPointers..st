*ETLoad-hook
loadOldSegmentFrom: segmentWordArray outPointers: outPointerArray
	"send when the #loadSegmentFrom:outPointers: primitve fails"
	"FIXME: the original segmentWordArray (not the copy passed to this method) needs to be becomed into into the loaded objects."
	ETLSegmentLoader loadImageSegmentFrom: segmentWordArray outPointers: outPointerArray.
