private
processEventsAndWait
	[ self eventsPending ]
		whileTrue: [ self mainIterationDo: false ].
	delay wait.