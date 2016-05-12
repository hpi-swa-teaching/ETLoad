like fullCopy
fixDependents
	"They are not used much, but need to be right"

	DependentsFields associationsDo: [:pair |
		pair value do: [:dep | 
			| newDep newModel |
			newDep := references at: dep ifAbsent: [nil].
			newDep ifNotNil: [
				newModel := references at: pair key ifAbsent: [pair key].
				newModel addDependent: newDep]]].
