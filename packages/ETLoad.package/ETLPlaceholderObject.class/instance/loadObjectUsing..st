loading
loadObjectUsing: oopMap
	(self objectClass includesBehavior: Symbol) ifTrue: [
		"Intern symbols to preserve equality <=> reference equality"
		^ Symbol intern: self loadIndexableByteFieldsObject asString. ].

	^ self loadNormallyUsing: oopMap.