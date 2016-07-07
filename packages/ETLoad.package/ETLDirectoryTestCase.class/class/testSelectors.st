accessing
testSelectors
	| files |
	
	files := OrderedCollection new.
	
	self searchDirectory directoryContentsFor: self searchDirectory pathName do: [ :entry |
		entry isDirectory ifFalse: [ files add: (self mapFile: entry name). ]. ].

	 ^ (files select: [ :file | file notNil. ] thenCollect: [ :file | (self testMethodPrefix , file) asSymbol]) sorted.