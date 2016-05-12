prefs - window colors
installNormalWindowColors
	"Install the factory-provided default window colors for all tools"

	"Preferences installNormalWindowColors"

	self installWindowColorsVia: [:aSpec | aSpec normalColor]