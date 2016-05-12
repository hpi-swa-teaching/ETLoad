accessing
highestUpdate
	| sortedUpdates |
	highestUpdate ifNil: [
		sortedUpdates := self updates asSortedCollection.
		highestUpdate := (sortedUpdates isEmpty
			ifTrue: [0]
			ifFalse: [sortedUpdates last])].
	^highestUpdate