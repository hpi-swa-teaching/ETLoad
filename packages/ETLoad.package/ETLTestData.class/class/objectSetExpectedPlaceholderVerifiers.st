constants
objectSetExpectedPlaceholderVerifiers
	"Mapping from expected oops to blocks to verify placeholders."

	^ Dictionary withAll:  ((1 to: self objectSetOops size) collect: [ :i |
		(self objectSetOops at: i) -> [ :placeholder |
			(placeholder header = (self objectSetHeaders at: i))
				and: [placeholder bodyStream upToEnd = (self objectSetContents at: i). ]. ]. ]).