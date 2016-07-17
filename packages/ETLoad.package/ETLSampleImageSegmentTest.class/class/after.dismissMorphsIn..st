utility
after: aBlock dismissMorphsIn: aCollection
	"Execute aBlock ensuring that all morphs in aCollection are dismissed after it's execution.
	 If aBlock expects an arugment, it receives aCollection as that argument."

	[ aBlock cull: aCollection ] ensure: [ aCollection do: [ :object | object maybeDismissMorph. ]. ].