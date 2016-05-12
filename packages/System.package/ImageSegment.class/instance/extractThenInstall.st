read/write segment
extractThenInstall
	"For testing only"

	| newRoots |
	state = #activeCopy ifFalse: [self errorWrongState].
	arrayOfRoots elementsForwardIdentityTo:
		(arrayOfRoots collect: [:r | r rootStubInImageSegment: self]).
	state := #active.
	newRoots := self loadSegmentFrom: segment outPointers: outPointers.
	state := #inactive.
	arrayOfRoots elementsForwardIdentityTo: newRoots.
