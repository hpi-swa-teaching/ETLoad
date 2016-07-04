private
doesNotUnderstand: aMessage
	"intercept test messages and forward them to #testFile with
	the file name extracted from the message selector."

	(aMessage selector startsWith: 'test') ifTrue: [
		^ self testFile: (aMessage selector allButFirst: 4). ].
	
	^ super doesNotUnderstand: aMessage.