support
getSamplesDirectoryFromEnv
	| directory libc |
	
	libc := LibCLibrary new.
	
	directory := libc getenv: 'ETL_SAMPLE_DIRECTORY'.
	
	 directory ifNil: [
  		self error: 'ETL_SAMPLE_DIRECTORY not set'.
 	].
	
	directory := FileDirectory on: directory.
	
	directory directoryEntry. "verify directory exists"
	
	^ directory.