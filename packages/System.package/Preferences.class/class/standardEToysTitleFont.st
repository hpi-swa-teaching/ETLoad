prefs - fonts
standardEToysTitleFont
	"Answer the font to be used in the eToys environment"
	^ Parameters at: #eToysTitleFont ifAbsentPut: [self standardEToysFont]