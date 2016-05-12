browsing
openClassListBrowser: anArray title: aString
	"Open a class list browser"
	self default ifNil:[^self inform: 'Cannot open ClassListBrowser'].
	^self default openClassListBrowser: anArray title: aString