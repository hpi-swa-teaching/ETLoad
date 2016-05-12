query
allCallsOn: aLiteral localToPackage: packageNameOrInfo
	"Answer a sorted collection of MethodReferences for all the methods that call on aLiteral in the given package."

	^self
		allCallsOn: aLiteral
		fromBehaviors: (self packageInfoFor: packageNameOrInfo) classesAndMetaClasses
		sorted: true