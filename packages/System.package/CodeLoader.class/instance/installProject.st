installing
installProject
	"Assume that we're loading a single file and it's a project"
	| aStream |
	aStream := sourceFiles first contentStream.
	aStream ifNil:[^self error:'Project was not loaded'].
	ProjectLoading
			openName: nil 		"<--do we want to cache this locally? Need a name if so"
			stream: aStream
			fromDirectory: nil
			withProjectView: nil.
