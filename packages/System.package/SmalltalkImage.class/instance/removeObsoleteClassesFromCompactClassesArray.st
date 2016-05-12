housekeeping
removeObsoleteClassesFromCompactClassesArray

	self compactClassesArray doWithIndex: [ :each :index |
		(each notNil and: [
			each isObsolete and: [
			each instanceCount = 0 ] ]) ifTrue: [
				Smalltalk compactClassesArray at: index put: nil ] ].