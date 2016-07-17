accessing
bodySizeInWords
	"Size of the stored body objects in 4 byte words. Counts the base header but not the optional class and size header."

	^ self objectSizeInWords - 1.
