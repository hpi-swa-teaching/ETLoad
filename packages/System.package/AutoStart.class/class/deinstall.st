class initialization
deinstall
	"AutoStart deinstall"

	Smalltalk removeFromStartUpList: AutoStart.
	InstalledLaunchers := nil