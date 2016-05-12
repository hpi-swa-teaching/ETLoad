running
showSplashMorph
	SplashMorph ifNil:[^self].
	self showSplash
		ifFalse: [^self].
	World submorphs do:[:m| m visible: false]. "hide all"
	World addMorphCentered: SplashMorph.
	World displayWorldSafely.