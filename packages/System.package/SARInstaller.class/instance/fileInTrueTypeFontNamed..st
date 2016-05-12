client services
fileInTrueTypeFontNamed: memberOrName

	| member description |
	member := self memberNamed: memberOrName.
	member ifNil: [^self errorNoSuchMember: memberOrName].

	description := TTFontDescription addFromTTStream: member contentStream.
	TTCFont newTextStyleFromTT: description.

	World doOneCycle.
	self installed: member