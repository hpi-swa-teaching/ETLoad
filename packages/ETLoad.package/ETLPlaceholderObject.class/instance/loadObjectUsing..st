loading
loadObjectUsing: oopMap
	(self objectClass includesBehavior: Symbol) ifTrue: [
		"Intern symbols to preserve equality <=> reference equality"
		^ Symbol intern: self loadIndexableByteFieldsObject asString. ].
	
	(self objectClass includesBehavior: Float) ifTrue: [ | float |
		float := BoxedFloat64 basicNew.
		float instVarAt: 2 put: self bodyStream next.
		float instVarAt: 1 put: self bodyStream next.
		^ float. ].

	^ self loadNormallyUsing: oopMap.