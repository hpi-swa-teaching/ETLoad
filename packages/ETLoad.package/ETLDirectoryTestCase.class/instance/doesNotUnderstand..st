private
doesNotUnderstand: aMessage
	"intercept test messages and forward them to #testFile with
	the file name extracted from the message selector."

	(aMessage selector startsWith: self class testMethodPrefix) ifTrue: [
		^ self testFile: (aMessage selector allButFirst: self class testMethodPrefix size). ].

	^ super doesNotUnderstand: aMessage.