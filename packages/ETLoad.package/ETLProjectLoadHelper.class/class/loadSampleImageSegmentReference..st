loading
loadSampleImageSegmentReference: name
	| file |

	file := self getSamplesDirectoryFromEnv / 'image-segments' / (name, '.st').

	file readStreamDo: [ :stream |
		^ Compiler evaluate: stream contents. ].