utilities
allNamesAndProjects
	^ (self allProjects asSortedCollection: [:p1 :p2 | p1 name asLowercase < p2 name asLowercase]) collect:
		[:aProject | Array with: aProject name with: aProject]