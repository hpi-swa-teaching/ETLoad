accessing
maximumUsableAreaInWorld: aWorldOrNil

	| allowedArea |
	allowedArea := Display usableArea.
	aWorldOrNil ifNotNil: [
		allowedArea := allowedArea intersect: aWorldOrNil visibleClearArea.
	].
	(Smalltalk isMorphic and: [self respondsTo: #reduceByFlaps:]) ifTrue:
		[allowedArea := self reduceByFlaps: allowedArea].
	^allowedArea