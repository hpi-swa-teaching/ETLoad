*System-Support-window color
windowColorSpecification
	"Answer a WindowColorSpec object that declares my preference.
	This is a backstop for classes that don't otherwise define a preference."

	^ WindowColorSpec classSymbol: self name
		wording: 'Default' brightColor: #veryVeryLightGray
		pastelColor: #veryVeryLightGray
		normalColor: #veryVeryLightGray
		helpMessage: 'Other windows without color preferences.'