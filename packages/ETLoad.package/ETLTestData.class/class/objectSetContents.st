constants
objectSetContents
	"Expected binary contents from parsing objectSetData."

	^ self objectSetHeaders collect: [ :header | self dummyContentFor: header ].