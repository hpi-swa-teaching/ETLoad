*ETLoad-AlienExt
getenv: name
	| result argument alienMethod |
	
	(name isKindOf: String) ifFalse: [
		Error signal: 'name must be a string'. ]. "verify to prevent crashes"
	
	argument := name asAlien.
	result := Alien forPointer: 0.
	
	alienMethod := self alienMethodNamed: 'getenv'.
	
	alienMethod primFFICallResult: result with: argument pointer.
	
	argument free.
	
	result address = 0 ifTrue: [ ^ nil. ] ifFalse: [ ^ result strcpy. ].