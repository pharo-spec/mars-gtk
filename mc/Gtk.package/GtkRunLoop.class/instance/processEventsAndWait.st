private
processEventsAndWait
	self checkSession ifFalse: [ ^ self stop ]. 
	[ self isRunning 
		ifTrue: [ self getEventsPending ]
		ifFalse: [ false ] ]
	whileTrue: [ self mainIterationDo: true ].
	delay wait.