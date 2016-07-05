loading
resolve: anOop using: oopMap
	"Resolves the given oop using the oop map.
	
	As is explained in the SqueakJS source code [1], image segments can contain stack 
	frames containing invalid oops which have not been cleaned up. For now, we just
	replace them all with nil.
	
	[1]: https://github.com/bertfreudenberg/SqueakJS/blob/master/vm.js#L1551"

	^ oopMap resolve: anOop ifInvalid: [ ^ nil. ].