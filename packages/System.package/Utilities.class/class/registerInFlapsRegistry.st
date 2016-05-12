class initialization
registerInFlapsRegistry
	"Register the receiver in the system's flaps registry"
	self environment
		at: #Flaps
		ifPresent: [:cl | cl registerQuad: #(Utilities	recentSubmissionsWindow	'Recent'		'A message browser that tracks the most recently-submitted methods')
						forFlapNamed: 'Tools'.]