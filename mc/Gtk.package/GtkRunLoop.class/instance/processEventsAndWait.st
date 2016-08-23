private
processEventsAndWait
	[ self isRunning 
		ifTrue: [ self getEventsPending ]
		ifFalse: [ false ] ]
	whileTrue: [ self mainIterationDo: false ].
	delay wait.