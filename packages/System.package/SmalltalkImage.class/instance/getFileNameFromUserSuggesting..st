snapshot and quit
getFileNameFromUserSuggesting: aName
	"Ask the user for a new image name"
	| newName |
	newName := UIManager default
		request: 'New File Name?' translated
		initialAnswer: aName.
	newName isEmpty ifTrue: [^nil].
	((FileDirectory default fileOrDirectoryExists: (self fullNameForImageNamed: newName)) or:
	 [FileDirectory default fileOrDirectoryExists: (self fullNameForChangesNamed: newName)]) ifTrue: [
		(self confirm: ('{1} already exists. Overwrite?' translated format: {newName})) ifFalse: [^nil]].
	^newName
