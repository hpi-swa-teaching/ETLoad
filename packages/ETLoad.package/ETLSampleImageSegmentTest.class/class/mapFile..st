file-listing
mapFile: aFile
	(aFile endsWith: '.ims')
		ifTrue: [ ^ aFile allButLast: 4. ]
		ifFalse: [ ^ nil. ].
	