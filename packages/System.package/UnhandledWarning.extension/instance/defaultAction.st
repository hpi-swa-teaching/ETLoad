*System-priv handling
defaultAction

	^ ToolSet
		debugContext: self exception signalerContext
		label: 'Warning'
		contents: self exception messageText , '\\Select Proceed to continue, or close this window to cancel the operation.' withCRs