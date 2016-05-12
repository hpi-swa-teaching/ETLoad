release
deletingProject: aProject
	"Clear my previousProject link if it points at the given Project, which is being deleted."

	self flag: #bob.		"zapping projects"

	parentProject == aProject ifTrue: [
		parentProject := parentProject parent
	].
	previousProject == aProject
		ifTrue: [previousProject := nil].
	nextProject == aProject
		ifTrue:	[nextProject := nil]
