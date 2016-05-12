eToy login
prepareForLogin
	"Prepare for login - e.g., hide everything so only the login morph is visible."
	World submorphsDo:[:m| 
		m isLocked ifFalse:[m hide]]. "hide all those guys"
	World displayWorldSafely.
