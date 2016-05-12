accessing
assuredPreferenceDirectory
	"Answer the preference directory, creating it if necessary"

	|  prefDir |
	prefDir := self preferenceDirectory.
	prefDir
		ifNil:
			[prefDir := FileDirectory default directoryNamed: self preferenceDirectoryName.
			prefDir assureExistence].
	^ prefDir