loading
loadProjectFromFile: aFile inDirectory: anAbsolutePath
	| dir |
	dir := FileDirectory on: anAbsolutePath.
	dir directoryEntry. "verify the directory exists"
	
	self loadProjectFromFile: (dir entryAt: aFile).