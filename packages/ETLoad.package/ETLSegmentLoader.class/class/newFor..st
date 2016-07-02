instance creation
newFor: data
	"Creates a new loader for the given image segment data."
	^ self new
		data: data;
		yourself.