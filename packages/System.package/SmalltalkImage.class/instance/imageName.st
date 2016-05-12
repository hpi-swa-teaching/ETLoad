image, changes names
imageName
	"Answer the full path name for the current image."
	"Smalltalk imageName"

	| str |
	str := self primImageName.
	^ (FilePath pathName: str isEncoded: true) asSqueakPathName.
