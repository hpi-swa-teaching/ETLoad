private
acquireCompactClassFrom: compactClasses
	"Loads the compact class of the represented object from the given array."

	"compact class indices are saved 1 based, so no need to adjust it"
	self objectClass: ((compactClasses at: self header compactClassIndex)
		ifNil: [ ETLIncompatibleObjectError signal: 'Invalid compact class'. ]).