constants
objectSetOops
	"Expected oops from parsing objectSetData."

	^ { 0 . 
	      ETLTestData oneWordHeader objectSizeInWords * 4 . 
		ETLTestData oneWordHeader objectSizeInWords * 4 + 
			((ETLTestData twoWordHeader objectSizeInWords + 1) * 4) }.