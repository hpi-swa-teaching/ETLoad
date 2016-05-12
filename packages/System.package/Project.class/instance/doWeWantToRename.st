menu messages
doWeWantToRename

	| want |

	self hasBadNameForStoring ifTrue: [^true].
	(self name beginsWith: 'Unnamed') ifTrue: [^true].
	want := world valueOfProperty: #SuperSwikiRename ifAbsent: [false].
	world removeProperty: #SuperSwikiRename.
	^want

