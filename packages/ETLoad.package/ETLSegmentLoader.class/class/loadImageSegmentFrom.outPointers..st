loading
loadImageSegmentFrom: segmentWordArray outPointers: outPointerArray
	| rootObject |
	
	rootObject := (ETLSegmentLoader newFor: segmentWordArray) loadUsing: outPointerArray.
	ETLLoadCallback value ifNotNilDo: [ :callback | callback value: rootObject. ].
	^ rootObject.