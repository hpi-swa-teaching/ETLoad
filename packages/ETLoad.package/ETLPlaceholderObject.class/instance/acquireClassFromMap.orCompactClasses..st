loading
acquireClassFromMap: oopMap orCompactClasses: compactClasses
	"Acquires a reference to the class of the unloaded object."

	self header classOop
		ifNil: [ self acquireCompactClassFrom: compactClasses. ]
		ifNotNil: [ self acquireNonCompactClassFrom: oopMap. ].