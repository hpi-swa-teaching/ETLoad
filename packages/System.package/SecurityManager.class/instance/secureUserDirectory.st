accessing
secureUserDirectory
	"SecurityManager default secureUserDirectory"
	| dir |
	dir := self primSecureUserDirectory.
	^ dir
		ifNil: [FileDirectory default pathName]
		ifNotNil: [(FilePath pathName: dir isEncoded: true) asSqueakPathName]