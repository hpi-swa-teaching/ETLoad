loading
loadUsing: oopMap
	"Loads the receiver into a real object becoming the receiver."

	self becomeForward: (self loadObjectUsing: oopMap) copyHash: false.