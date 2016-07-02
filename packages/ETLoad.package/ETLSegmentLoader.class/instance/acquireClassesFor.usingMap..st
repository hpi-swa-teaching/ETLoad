loading
acquireClassesFor: placeholders usingMap: oopMap
	"Lets all placeholders acquire the class of the object they represent."

	placeholders do: [ :placeholder |
		placeholder
			acquireClassFromMap: oopMap
			orCompactClasses: self class assumedCompactClasses. ].