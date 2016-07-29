loading
loadSampleImageSegment: name
	| file |

	file := self getSamplesDirectoryFromEnv / 'image-segments' / (name, '.ims').
	
	file readStreamDo: [ :stream |
		(ObjectScanner new scanFrom: stream). ].