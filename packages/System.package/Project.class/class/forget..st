utilities
forget: aProject

	AllProjects := self allProjects reject: [ :x | x == aProject].
