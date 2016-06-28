private
acquireCompactClassFrom: compactClasses
	"Loads the compact class of the represented object from the given array."
	
	"compact class indices are saved and loaded 0 based"
	self objectClass: ((compactClasses at: self header compactClassIndex + 1)
		ifNil: [ ETLIncompatibleObjectError
			signal: 'Invalid compact class'. ])