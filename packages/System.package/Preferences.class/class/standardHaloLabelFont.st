prefs - fonts
standardHaloLabelFont
	"Answer the font to be used in the eToys environment"
	^ Parameters at: #haloLabelFont ifAbsentPut: [TextStyle defaultFont]