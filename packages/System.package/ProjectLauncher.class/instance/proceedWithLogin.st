eToy login
proceedWithLogin
	eToyAuthentificationServer := nil.
	World submorphsDo:[:m| m show].
	WorldState addDeferredUIMessage: [self startUpAfterLogin].