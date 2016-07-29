steps
preLoad
	self checkFileCompatibility.

	Gofer it
		squeaksource:'MetacelloRepository' ;
		package: 'ConfigurationOfAlien';
		load.

	(Smalltalk at: #ConfigurationOfAlien)
		loadCore;
		loadTests;
		loadLibC.