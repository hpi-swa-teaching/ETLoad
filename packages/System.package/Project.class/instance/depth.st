active process
depth
	"Return the depth of this project from the top.
	 topProject = 0, next = 1, etc."
	"Project current depth."

	| depth topProject project |
	depth := 0.
	topProject := Project topProject.
	project := self.
	
	[project ~= topProject and:[project notNil]]
		whileTrue:
			[project := project parent.
			depth := depth + 1].
	^ depth