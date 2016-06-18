support
loadProjectFromFile: entry
	self withCalendarMorph: [
		ProjectLoading openFromDirectory: entry containingDirectory andFileName: entry name. ].