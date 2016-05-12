testing
swapOutProjects  "ImageSegment swapOutProjects"  
	"Swap out segments for all projects other than the current one."

	| spaceLeft |
	spaceLeft := Smalltalk garbageCollect.
	Project allProjects doWithIndex:
		[:p :i | | newSpaceLeft | p couldBeSwappedOut ifTrue:
			[Transcript cr; cr; nextPutAll: p name.
			(ImageSegment new copyFromRoots: (Array with: p) sizeHint: 0)
				extract; writeToFile: 'project' , i printString.
			newSpaceLeft := Smalltalk garbageCollect.
			Transcript cr; print: newSpaceLeft - spaceLeft; endEntry.
			spaceLeft := newSpaceLeft]].