accessing
majorMinorVersion
	"Return the major/minor version number of the form X.Y, without any 'alpha' or 'beta' or other suffix."
	"(SystemVersion new version: 'Squeak3.7alpha') majorMinorVersion" "  -->  'Squeak3.7' "
	"SystemVersion current majorMinorVersion"
	
	| char stream |
	stream := ReadStream on: version, 'x'.
	stream upTo: $..
	char := stream next.
	char ifNil: [^ version].	"eg: 'Jasmine-rc1' has no $. in it."
	[char isDigit]
		whileTrue: [char := stream next].
	^ version copyFrom: 1 to: stream position - 1
