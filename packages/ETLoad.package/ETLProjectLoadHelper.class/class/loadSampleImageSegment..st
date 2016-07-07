loading
loadSampleImageSegment: name
	| file |

	file := self getSamplesDirectoryFromEnv / 'image-segments' / (name, '.ims').
	
	FileStream fileNamed: file pathName do: [ :stream |
		(ObjectScanner new scanFrom: stream). ].