compatibility
compatibilityTests
	"Answers a dictionary containing, for each valid Squeak 3 object format a block that
	takes a Squeak 5 object format and answers, whether it is compatibel with the Squeak 3
	format.
	
	See the wiki page 'Object Formats' for further info."
	| indexableByteFieldsTest compiledMethodTest |

	indexableByteFieldsTest := [ :squeak5InstSpec | squeak5InstSpec between: 16 and: 23. ].
	compiledMethodTest := [ :squeak5InstSpec | squeak5InstSpec between: 24 and: 31. ].
	^ Dictionary newFrom: {
		0 -> [ :squeak5InstSpec | squeak5InstSpec = 0. ] .
		1 -> [ :squeak5InstSpec | squeak5InstSpec = 1. ] .
		2 -> [ :squeak5InstSpec | squeak5InstSpec = 2. ] .
		3 -> [ :squeak5InstSpec | squeak5InstSpec = 3. ] .
		6 -> [ :squeak5InstSpec | squeak5InstSpec between: 10 and: 11. ] .
		8 -> indexableByteFieldsTest .
		9 -> indexableByteFieldsTest .
		10 -> indexableByteFieldsTest .
		11 -> indexableByteFieldsTest .
		12 -> compiledMethodTest .
		13 -> compiledMethodTest .
		14 -> compiledMethodTest .
		15 -> compiledMethodTest }.