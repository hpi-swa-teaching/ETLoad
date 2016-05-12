initialize-release
setStandardClass: aClass

	self
		setClassSymbol:  aClass theNonMetaClass name
		classIsMeta: aClass isMeta
		stringVersion: aClass name