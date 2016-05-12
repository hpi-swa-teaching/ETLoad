enter
saveState
	"Save the current state in me prior to leaving this project"

	changeSet := ChangeSet current.
	thumbnail ifNotNil: [thumbnail hibernate].
	transcript := Transcript.