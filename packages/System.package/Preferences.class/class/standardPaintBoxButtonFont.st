prefs - fonts
standardPaintBoxButtonFont
	"Answer the font to be used in the eToys environment"
	^ Parameters at: #paintBoxButtonFont ifAbsentPut: [self standardButtonFont]