command line
vmPath
	"Answer the path for the directory containing the Smalltalk virtual machine. Return the 	empty string if this primitive is not implemented."
	"Smalltalk vmPath"

	^ (FilePath pathName: (self primVmPath) isEncoded: true) asSqueakPathName.