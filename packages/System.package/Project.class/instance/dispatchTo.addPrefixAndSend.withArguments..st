dispatching
dispatchTo: requestor addPrefixAndSend: baseSelector withArguments: arguments
	"Sender wants to perform a method with dependencies on the type of project.
	Dispatch to an appropriate method for the current project.
	
	This method is a workaround for lack of proper ToolBuilder support in the sender,
	and should be eliminated when possible (dtl Feb 2010)"

	| selector |
	"Flag target selectors to help identify senders"
	true ifFalse: [
		self flag: #mvcOpenLabel:in: .
		self flag: #morphicOpenLabel:in: .
		self flag: #mvcStartUpLeftFlush .
		self flag: #morphicStartUpLeftFlush .
		self flag: #mvcStartUpWithCaption:icon:at:allowKeyboard: .
		self flag: #morphicStartUpWithCaption:icon:at:allowKeyboard: .
		self flag: #mvcOpen: .
		self flag: #morphicOpen: .
		self flag: #mvcOpen .
		self flag: #morphicOpen .
		self flag: #mvcOpenOn:context:label:contents:fullView: .
		self flag: #morphicOpenOn:context:label:contents:fullView: .
		self flag: #mvcResumeProcess: .
		self flag: #morphicResumeProcess:
	].
	selector := (self selectorPrefixForDispatch, baseSelector) asSymbol.
	^ requestor perform: selector withArguments: arguments