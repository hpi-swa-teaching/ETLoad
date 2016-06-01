comparing
hash
	^ self sizeInWords hash
		bitXor: (self compactClassIndex hash
		bitXor: (self classOop hash
		bitXor: (self objectHash hash 
		bitXor: self objectFormat hash))).