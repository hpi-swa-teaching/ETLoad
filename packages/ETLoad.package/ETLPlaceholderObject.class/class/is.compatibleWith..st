compatibility
is: squeak3ObjectFormat compatibleWith: squeak5InstSpec
	"Answers whether the Squeak 3 object format is compatible with the Squeak 5 object format."
	| testBlock |
	
	testBlock := (self compatibilityTests
		at: squeak3ObjectFormat
		ifAbsent: [ [ false. ]. ]).
	^ testBlock cull: squeak5InstSpec.