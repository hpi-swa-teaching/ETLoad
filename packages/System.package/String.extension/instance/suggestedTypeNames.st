*system
suggestedTypeNames
	^ Array streamContents:
		[ : stream |
		self withIndexDo:
		[ : eachChar : index |
		eachChar isUppercase ifTrue:
			[ stream nextPut: 
				(self
					copyFrom: index
					to: self size) withBlanksTrimmed.
			"Often, argument names that refer to Collections end in the letter s, which can cause the suggested type-name to not be found.  Account for this."
			self last = $s
				ifTrue:
					[ stream nextPut:
						(self
							copyFrom: index
							to: self size-1) withBlanksTrimmed ] ] ] ]