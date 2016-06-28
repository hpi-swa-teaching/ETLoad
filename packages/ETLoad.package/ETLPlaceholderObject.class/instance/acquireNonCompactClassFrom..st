private
acquireNonCompactClassFrom: oopMap
	"Acquires the non compact class of the represented object from the given map."
	
	self objectClass: (oopMap
		resolve: self header classOop
		ifInvalid: [ ETLIncompatibleObjectError signal: 'Invalid class oop'. ]).