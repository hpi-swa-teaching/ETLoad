prefs - fonts
standardCodeFont
	"Answer the font to be used in code"
	 ^ Parameters at: #standardCodeFont ifAbsentPut: [TextStyle defaultFont]