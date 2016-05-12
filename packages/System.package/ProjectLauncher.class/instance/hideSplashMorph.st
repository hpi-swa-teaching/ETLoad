running
hideSplashMorph
	SplashMorph ifNil:[^self].
	self showSplash
		ifFalse: [^self].
	SplashMorph delete.
	World submorphs do:[:m| m visible: true]. "show all"
