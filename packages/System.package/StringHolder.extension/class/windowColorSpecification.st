*System-Support-window colorwindow color
windowColorSpecification
	"Answer a WindowColorSpec object that declares my preference"

	^ WindowColorSpec classSymbol: self name wording: 'Workspace' brightColor: #lightYellow pastelColor: #paleYellow helpMessage: 'A place for text in a window.'