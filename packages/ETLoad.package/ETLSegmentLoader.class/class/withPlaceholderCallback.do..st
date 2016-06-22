loading
withPlaceholderCallback: callback do: aBlock
	placeholderCallback ifNotNil: [ self signal: 'there already is a placeholderCallback registered' ].
	placeholderCallback := callback.
	
	^ aBlock ensure: [ placeholderCallback := nil. ].