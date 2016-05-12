(PackageInfo named: 'System') postscript: '" Convert SoundService registeredClasses to classes if necessary "
[ | currentSoundSystem |
	currentSoundSystem := SoundService defaultOrNil.
	(SoundService registeredClasses copy collect: [:ss |
		SoundService unregister: ss.
		ss isBehavior 
			ifTrue: [ss]
			ifFalse: [ss class]]
	) do: [:ssClass |
		SoundService register: ssClass].
	SoundService default: (currentSoundSystem
		ifNotNil: [:css| css isBehavior ifTrue: [css] ifFalse: [css class]]).
] value.

"Convert preferences dictionary from class var to inst var if necessary."
(Preferences instVarNamed: ''preferencesDictionary'') ifNil:
	[(Preferences classPool at: #DictionaryOfPreferences) ifNotNil:
		[:dictionary|
			Preferences
				instVarNamed: ''preferencesDictionary''
				put: dictionary]].

(Smalltalk classNamed: #ServicePreferences) ifNotNil:
	[:sp|
	(sp instVarNamed: ''preferencesDictionary'') ifNil:
	[(sp classPool at: #ServiceDictionaryOfPreferences) ifNotNil:
		[:dictionary|
			sp
				instVarNamed: ''preferencesDictionary''
				put: dictionary]]]'!
