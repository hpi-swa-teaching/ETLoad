prefs - fonts
windowTitleFont
	"Answer the standard font to use for window titles"
	^  Parameters at: #windowTitleFont ifAbsentPut: [StrikeFont familyName: #NewYork size: 15]