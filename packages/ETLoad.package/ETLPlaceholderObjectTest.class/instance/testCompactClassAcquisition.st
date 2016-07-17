testing
testCompactClassAcquisition
	| header compactClass compactClasses placeholder |

	header := ETLTestData oneWordHeader copy
		compactClassIndex: 1;
		yourself.
	compactClass := Object new.
	compactClasses := { compactClass }, ((1 to: 31) collect: [ :i | nil. ]).
	placeholder := ETLPlaceholderObject newFrom: header and: nil.
	placeholder acquireClassFromMap: nil orCompactClasses: compactClasses.
	self assert: compactClass identical: placeholder objectClass.