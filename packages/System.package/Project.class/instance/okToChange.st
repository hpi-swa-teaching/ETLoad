release
okToChange
	"Answer whether the window in which the project is housed can be dismissed -- which is destructive. We never clobber a project without confirmation"

	| ok is list |
	self subProjects size  >0 ifTrue:
		[self inform: 
('The project {1}
contains sub-projects.  You must remove these
explicitly before removing their parent.' translated format:{self name}).
		^ false].
	ok := world isNil or: [world isMorph not and: [world scheduledControllers size <= 1]].
	ok ifFalse: [self isMorphic ifTrue:
		[self parent == CurrentProject 
			ifFalse: [^ true]]].  "view from elsewhere.  just delete it."
	ok := self confirm:
('Really delete the project
{1}
and all its windows?' translated format:{self name}).
		
	ok ifFalse: [^ false].

	world isMorph ifTrue:
		[Smalltalk at: #WonderlandCameraMorph ifPresent:[:aClass |
			world submorphs do:   "special release for wonderlands"
						[:m | (m isKindOf: aClass)
								and: [m getWonderland release]]].
			"Remove Player classes and metaclasses owned by project"
			is := ImageSegment new arrayOfRoots: (Array with: self).
			(list := is rootsIncludingPlayers) ifNotNil:
				[list do: [:playerCls | 
					(playerCls respondsTo: #isMeta) ifTrue:
						[playerCls isMeta ifFalse:
							[playerCls removeFromSystemUnlogged]]]]].

	self removeChangeSetIfPossible.
	"do this last since it will render project inaccessible to #allProjects and their ilk"
	ProjectHistory forget: self.
	Project deletingProject: self.
	^ true
