command line
vmFileName
	"Answer the absolute file name of the the Smalltalk virtual machine"
	"Smalltalk vmFileName"

	^ (FilePath pathName: (self primVmFileName) isEncoded: true) asSqueakPathName.
