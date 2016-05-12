shrinking
zapAllOtherProjects 
	"Smalltalk zapAllOtherProjects"
"Note: as of this writing, the only reliable way to get rid of all but the current project is te execute the following, one line at a time...
		Smalltalk zapAllOtherProjects.
		ProjectHistory currentHistory initialize.
		Smalltalk garbageCollect.
		Project rebuildAllProjects.
"

	
	Project allInstancesDo: [:p | p setParent: nil].
	Project current setParent: Project current.
	Project current isMorphic ifTrue: [ScheduledControllers := nil].
	TheWorldMenu allInstancesDo: [:m | 1 to: m class instSize do: [:i | m instVarAt: i put: nil]].
	ChangeSet classPool at: #AllChangeSets put: nil.
	Project classPool at: #AllProjects put: nil.
	ProjectHistory currentHistory initialize.
	CommandHistory resetAllHistory.
	ChangeSet initialize.
	Project rebuildAllProjects.  "Does a GC"
	Project allProjects size > 1 ifTrue: [Project allProjects inspect]