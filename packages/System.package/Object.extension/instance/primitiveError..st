*System-Recovery-error handling
primitiveError: aString 
	"This method is called when the error handling results in a recursion in 
	calling on error: or halt or halt:."
	| hasTranscripter transcripter |
	hasTranscripter := (Smalltalk classNamed: #Transcripter)
		ifNotNil: [ :t | transcripter := t. true]
		ifNil: [false].
	(String
		streamContents: 
			[:s |
			| context |
			s nextPutAll: '***System error handling failed***'.
			s cr; nextPutAll: aString.
			context := thisContext sender sender.
			20 timesRepeat: [context == nil ifFalse: [s cr; print: (context := context sender)]].
			s cr; nextPutAll: '-------------------------------'.
			hasTranscripter
				ifTrue: [
					s cr; nextPutAll: 'Type CR to enter an emergency evaluator.'.
					s cr; nextPutAll: 'Type any other character to restart.']
				ifFalse: [
					s cr; nextPutAll: 'Type any character to restart.']])
		displayAt: 0 @ 0.
	[Sensor keyboardPressed] whileFalse.
	Sensor keyboard = Character cr ifTrue: [
		hasTranscripter ifTrue: [transcripter emergencyEvaluator]].
	Project current resetDisplay