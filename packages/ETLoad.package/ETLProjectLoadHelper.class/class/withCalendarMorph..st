support
withCalendarMorph: aBlock
	"Evaluate the given block while ensuring that the CalendarMorph global exists.
	 This prevents the confirmation about loading an EToys 5.0 project."

	(Smalltalk includesKey: #CalendarMorph) 
		ifTrue: [ aBlock value. ]
		ifFalse: [ [
			Smalltalk globals at: #CalendarMorph put: Object new.
			aBlock value.
		] ensure: [ Smalltalk globals removeKey: #CalendarMorph. ]. ].