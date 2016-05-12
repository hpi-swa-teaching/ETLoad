prefs - fonts
standardEToysFont
	"Answer the font to be used in the eToys environment"
	^ Parameters at: #eToysFont ifAbsentPut: [self standardButtonFont]