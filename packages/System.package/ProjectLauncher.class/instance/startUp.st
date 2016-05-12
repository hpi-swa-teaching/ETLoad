running
startUp
	World ifNotNil: [World install].
	Utilities authorName: ''.
	Preferences eToyLoginEnabled
		ifFalse:[^self startUpAfterLogin].
	self doEtoyLogin.