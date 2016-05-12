prefs - fonts
standardButtonFont
	"Answer an attractive font to use for buttons"
	"Answer the font to be used for textual flap tab labels"
	^ Parameters 
			at: #standardButtonFont 
			ifAbsentPut: [StrikeFont familyName: #ComicBold size: 16]