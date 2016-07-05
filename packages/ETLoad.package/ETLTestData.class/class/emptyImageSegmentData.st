constants
emptyImageSegmentData
	"Binary data for an empty image segment (contains an empty array)."
	
	^ { 16r73001966 .  "version number"
	     16r80000005 .   "class oop (first out pointer) + header format = 1"
	     16r00000205 }. "size = 1 word (base header), object format = 2, header format = 1"