instance creation
posixName: aString 
	^ self
		isoString: (aString copyReplaceAll: ':=' with: '-')