applying
apply
	"apply the receiver as the current theme"
	BalloonMorph balloonColor: self balloonColor.

	Preferences setParameter: #defaultWorldColor to: self defaultWorldColor.

	Preferences insertionPointColor: self insertionPointColor.
	Preferences keyboardFocusColor: self keyboardFocusColor.
	Preferences textHighlightColor: self textHighlightColor.

	Preferences setParameter: #menuTitleColor to: self menuTitleColor.
	Preferences setParameter: #menuTitleBorderColor to: self menuTitleBorderColor.
	Preferences setParameter: #menuTitleBorderWidth to: self menuTitleBorderWidth.
	Preferences setParameter: #menuColor to: self menuColor.
	Preferences setParameter: #menuBorderColor to: self menuBorderColor.
	Preferences setParameter: #menuLineColor to: self menuLineColor.
	Preferences setParameter: #menuBorderWidth to: self menuBorderWidth.
	Preferences setParameter: #menuSelectionColor to: self menuSelectionColor.

	SystemProgressMorph reset.

	self class current: self.
