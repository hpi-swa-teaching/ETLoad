utilities
deletingProject: outgoingProject

	| pvmClass |
	pvmClass := Smalltalk at: #ProjectViewMorph ifAbsent: [nil].
	ImageSegment allSubInstancesDo: [:seg |
		seg ifOutPointer: outgoingProject thenAllObjectsDo: [:obj |
			(obj isKindOf: pvmClass) ifTrue: [obj deletingProject: outgoingProject.  obj abandon].
			(obj isKindOf: Project) ifTrue: [obj deletingProject: outgoingProject]]].
	self allProjects do: [:p | p deletingProject: outgoingProject].	"ones that are in"
	pvmClass ifNotNil: [
		pvmClass allSubInstancesDo: [:p | 
			p deletingProject: outgoingProject.
			p project == outgoingProject ifTrue: [p abandon]]].
	AllProjects := self allProjects copyWithout: outgoingProject.