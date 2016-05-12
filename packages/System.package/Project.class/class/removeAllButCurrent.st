utilities
removeAllButCurrent
	"Project removeAllButCurrent"

	AllProjects := nil.
	Smalltalk garbageCollect.

	self removeAll: (Project allSubInstances copyWithout: Project current).

	AllProjects := nil.
	Smalltalk garbageCollect.

	Smalltalk garbageCollect.
	Project rebuildAllProjects.
	^AllProjects