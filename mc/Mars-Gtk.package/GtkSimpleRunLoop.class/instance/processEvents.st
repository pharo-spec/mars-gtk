private installing
processEvents
	[ self getEventsPending ]
	whileTrue: [ self mainIterationDo: true ]