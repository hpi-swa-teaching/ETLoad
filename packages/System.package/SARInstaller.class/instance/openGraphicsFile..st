client services
openGraphicsFile: memberOrName
	| member morph |
	member := self memberNamed: memberOrName.
	member ifNil: [ ^self errorNoSuchMember: memberOrName ].
	morph := (World drawingClass fromStream: member contentStream binary).
	morph ifNotNil: [ morph openInWorld ].
	self installed: member.