prefs - fonts
standardFlapFont
	"Answer the font to be used for textual flap tab labels"
	^ Parameters at: #standardFlapFont ifAbsentPut: [self standardButtonFont]