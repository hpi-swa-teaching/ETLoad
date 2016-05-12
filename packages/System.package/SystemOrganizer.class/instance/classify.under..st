accessing
classify: element under: newCategory
	| oldCategory class |
	oldCategory := self categoryOfElement: element.
	super classify: element under: newCategory.
	class := Smalltalk at: element ifAbsent: [^ self].
	self == SystemOrganization ifTrue: [
		SystemChangeNotifier uniqueInstance
			class: class
			recategorizedFrom: oldCategory
			to: newCategory]