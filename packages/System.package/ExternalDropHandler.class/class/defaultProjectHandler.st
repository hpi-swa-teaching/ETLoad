private
defaultProjectHandler
	^ExternalDropHandler
		type: nil
		extension: 'pr'
		action: [:stream |
				ProjectLoading
					openName: nil
					stream: stream
					fromDirectory: nil
					withProjectView: nil]
