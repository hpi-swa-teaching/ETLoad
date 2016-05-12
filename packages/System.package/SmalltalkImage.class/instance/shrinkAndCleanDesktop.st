shrinking
shrinkAndCleanDesktop
	World removeAllMorphs.
	self shrink.
	MorphicProject defaultFill: (Color gray: 0.9).
	World color: (Color gray: 0.9)