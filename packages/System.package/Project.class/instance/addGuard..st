accessing
addGuard: anObject
	"Add the given object to the list of objects receiving #okayToEnterProject on Project entry"
	guards ifNil:[guards := WeakArray with: anObject]
			ifNotNil:[guards := guards copyWith: anObject].