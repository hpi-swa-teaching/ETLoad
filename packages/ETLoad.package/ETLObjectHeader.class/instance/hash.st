comparing
hash
	^ self objectSizeInWords hash
		bitXor: (self compactClassIndex hash
		bitXor: (self classOop hash
		bitXor: (self objectHash hash 
		bitXor: self objectFormat hash))).