support
getSamplesDirectoryFromEnv
	| directory libc |
	
	libc := LibCLibrary new.
	
	directory := libc getenv: 'ETL_SAMPLES_DIRECTORY'.
	
	directory := FileDirectory on: directory.
	
	directory directoryEntry. "verify directory exists"
	
	^ directory.