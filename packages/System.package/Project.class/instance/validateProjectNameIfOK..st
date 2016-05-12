menu messages
validateProjectNameIfOK: aBlock

	| details |

	details := world valueOfProperty: #ProjectDetails.
	details ifNotNil: ["ensure project info matches real project name"
		details at: 'projectname' put: self name.
	].
	self doWeWantToRename ifFalse: [^aBlock value].
	(Smalltalk at: #EToyProjectDetailsMorph) ifNotNil: [:etpdm |
		etpdm
			getFullInfoFor: self 
			ifValid: [
				World displayWorldSafely.
				aBlock value.
			]
			expandedFormat: false]
