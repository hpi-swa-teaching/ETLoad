accessing
projectStreamFromArchive: archive
	| ext prFiles entry unzipped |
	ext := FileDirectory dot, Project projectExtension.
	prFiles := archive members select:[:any| any fileName endsWith: ext].
	prFiles isEmpty ifTrue:[^''].
	entry := prFiles first.
	unzipped := RWBinaryOrTextStream on: (ByteArray new: entry uncompressedSize).
	entry extractTo: unzipped.
	^unzipped reset