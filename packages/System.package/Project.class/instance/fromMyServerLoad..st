file in/out
fromMyServerLoad: otherProjectName
	| pair pr dirToUse |
	"If a newer version of me is on the server, load it."

	(pr := Project named: otherProjectName) ifNotNil: ["it appeared"
		^ pr enter
	].
	dirToUse := self primaryServerIfNil: [
		lastDirectory ifNil: [
			self inform: 'Current project does not know a server either.'.
			^nil].
		lastDirectory].

	pair := self class mostRecent: otherProjectName onServer: dirToUse.
	pair first ifNil: [^self decideAboutCreatingBlank: otherProjectName].	"nothing to load"
	^ProjectLoading
		installRemoteNamed: pair first
		from: dirToUse
		named: otherProjectName
		in: self

