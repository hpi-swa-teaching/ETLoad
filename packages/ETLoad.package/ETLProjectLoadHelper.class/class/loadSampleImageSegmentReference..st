loading
loadSampleImageSegmentReference: name
	| file |

	file := self getSamplesDirectoryFromEnv / 'image-segments' / (name, '.st').
	
	FileStream fileNamed: file pathName do: [ :stream |
		^ Compiler evaluate: stream contents ].