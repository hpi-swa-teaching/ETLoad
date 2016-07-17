constants
objectSetData
	"Binary data containing three example objects with dummy content."
	| contents |

	contents := self objectSetContents.
	^ self oneWordHeaderData , (contents at: 1) , 
		self twoWordHeaderData , (contents at: 2) , 
		self threeWordHeaderData , (contents at: 3).
		