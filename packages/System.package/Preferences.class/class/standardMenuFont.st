prefs - fonts
standardMenuFont
	"Answer the font to be used in menus"
	 ^ Parameters at: #standardMenuFont ifAbsentPut: [TextStyle defaultFont]