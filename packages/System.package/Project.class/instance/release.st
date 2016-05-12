release
release

	self flag: #bob.	"this can be trouble if Projects are reused before garbage collection"
	world == nil ifFalse:
		[world release.
		world := nil].
	^ super release