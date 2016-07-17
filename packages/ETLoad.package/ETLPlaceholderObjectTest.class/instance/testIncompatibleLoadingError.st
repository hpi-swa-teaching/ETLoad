testing
testIncompatibleLoadingError
	| classes |
	classes := Behavior allSubInstances.

	ETLTestData withIncompatibleFormatPairsDo: [ :s3Format :s5Format |
		| header placeholder s5Class |
		header := ETLTestData oneWordHeader copy
			objectFormat: s3Format;
			yourself.
		placeholder := ETLPlaceholderObject
			newFrom: header
			and: (ReadStream on: { }).
		s5Class := classes
			detect: [ :class | class instSpec = s5Format. ]
			ifFound: [ :class |
				placeholder objectClass: class.
				self should: [ placeholder loadUsing: nil. ] raise: ETLIncompatibleObjectError. ]
			ifNone: [ ]. ].