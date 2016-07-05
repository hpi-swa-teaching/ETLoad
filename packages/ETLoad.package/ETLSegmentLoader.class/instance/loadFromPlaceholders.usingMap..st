loading
loadFromPlaceholders: placeholders usingMap: oopMap
	"Loads the given placeholders into real objects"

	self acquireClassesFor: placeholders usingMap: oopMap.
	placeholders do: [ :placeholder |
		placeholder isLoadable ifFalse: [
			ETLIncompatibleObjectError signal: 'Loading classes is not yet supported'. ].
		placeholder loadUsing: oopMap. ].