instance creation
newVersion: versionName
	| newVersion |
	newVersion := self new version: versionName.
	newVersion
		highestUpdate: self current highestUpdate.
	Current := newVersion
