creating patches
buildDisplayPatch

	| stream |
	stream := AttributedTextStream new.
	self 
		patchSequenceDoIfMatch: [ :string |
			self print: string withAttributes: NormalTextAttributes on: stream ]
		ifInsert: [ :string |
			self print: string withAttributes: InsertTextAttributes on: stream ]
		ifRemove: [ :string |
			self print: string withAttributes: RemoveTextAttributes on: stream ].
	^stream contents