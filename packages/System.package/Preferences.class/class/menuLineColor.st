prefs - menus
menuLineColor
	^ Parameters
		at: #menuLineColor
		ifAbsentPut: [Preferences menuBorderColor lighter]