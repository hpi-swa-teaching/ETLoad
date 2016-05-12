services
serviceLoadVersion
	^ SimpleServiceEntry
		provider: self
		label: 'load'
		selector: #loadVersionFile:
		description: 'load a package version'