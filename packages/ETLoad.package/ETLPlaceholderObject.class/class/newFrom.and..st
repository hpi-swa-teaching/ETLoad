as yet unclassified
newFrom: header and: bodyStream
	"Create a new placeholder object with the given arguments."

	^ self new
		header: header;
		bodyStream: bodyStream;
		yourself.