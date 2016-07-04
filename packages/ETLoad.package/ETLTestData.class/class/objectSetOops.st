constants
objectSetOops
	"Expected oops from parsing objectSetData."

	^ { 4 . 
	      ETLTestData oneWordHeader objectSizeInWords * 4 + 8 . 
		ETLTestData oneWordHeader objectSizeInWords * 4 + 
			((ETLTestData twoWordHeader objectSizeInWords + 1) * 4) + 12 }.