private
processEventsAndWait
	[ self getEventsPending ]
	whileTrue: [ self mainIterationDo: false ].
	delay wait.