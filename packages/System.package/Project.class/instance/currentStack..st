accessing
currentStack: aStack
	"Set the current stack as indicated; if the parameter supplied is nil, delete any prior memory of the CurrentStack"

	aStack
		ifNil:
			[self removeParameter: #CurrentStack]
		ifNotNil:
			[self projectParameterAt: #CurrentStack put: aStack]