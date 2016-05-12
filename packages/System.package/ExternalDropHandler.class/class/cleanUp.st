class initialization
cleanUp
	"Reset and reinstall the drop handlers"

	self resetRegisteredHandlers.
	self registerStandardExternalDropHandlers.