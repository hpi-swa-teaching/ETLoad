utilities
allNames
	^ (self allProjects collect: [:p | p name]) asSortedCollection: [:n1 :n2 | n1 asLowercase < n2 asLowercase]