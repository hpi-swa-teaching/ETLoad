steps
checkFileCompatibility
	| version |
	version := (MCPackage named: 'Files') workingCopy currentVersionInfo.

	version versionNumber < 161 ifFalse: [ ^ self. ].

	UIManager default inform:
'For compatibility reasons, ETLoad requires at least Files-cmm.161, however
only ' ,  version name , ' was found in this image. Please ensure your image
includes the changes introduced by Files-cmm.161'.