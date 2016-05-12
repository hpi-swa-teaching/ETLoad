browse
allMethodsInCategory: category 
	| aCollection |
	aCollection := SortedCollection new.
	Cursor wait showWhile:
		[self allBehaviorsDo:
			[:x | (x allMethodsInCategory: category) do:
				[:sel | aCollection add: x name , ' ' , sel]]].
	^aCollection.
	