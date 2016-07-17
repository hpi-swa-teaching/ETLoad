support
getSamplesDirectoryFromEnv
	| directory |
	directory := LibCLibrary new getenv: 'ETL_SAMPLE_DIRECTORY'.
	
	directory ifNil: [
		self error: 'ETL_SAMPLE_DIRECTORY not set'. ].
	
	^ (FileDirectory on: directory)
		directoryEntry; "verify directory exists"
		yourself.
	