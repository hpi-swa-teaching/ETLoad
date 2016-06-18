instance creation
newFromInternalObjects: internalObjects andOutPointers: outPointers
	"Creates a new oop map with the given internal objects and out pointers."
	
	^ self new
		internalObjects: internalObjects;
		outPointers: outPointers;
		yourself.