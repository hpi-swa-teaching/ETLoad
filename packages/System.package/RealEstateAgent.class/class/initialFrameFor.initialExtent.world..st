framing
initialFrameFor: aView initialExtent: initialExtent world: aWorld

	| scaledExtent |
	scaledExtent := Preferences bigDisplay
		ifTrue: [(initialExtent * 1.75) rounded]
		ifFalse: [initialExtent].

	^ Preferences reverseWindowStagger
		ifTrue: [self strictlyStaggeredInitialFrameFor: aView initialExtent: scaledExtent world: aWorld]
		ifFalse: [self normalInitialFrameFor: aView initialExtent: scaledExtent world: aWorld]