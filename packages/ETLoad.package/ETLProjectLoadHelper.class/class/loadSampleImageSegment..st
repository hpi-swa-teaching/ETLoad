loading
loadSampleImageSegment: name
	| file |

	file := self getSamplesDirectoryFromEnv / 'image-segments' / name.
	
	FileStream fileNamed: file pathName do: [ :stream |
		(ObjectScanner new scanFrom: stream) next. ].