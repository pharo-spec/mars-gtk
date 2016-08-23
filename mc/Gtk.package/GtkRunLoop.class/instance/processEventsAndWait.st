private
processEventsAndWait
	[	self checkSession. 
		self getEventsPending ]
		whileTrue: [ self mainIterationDo: false ].
	delay wait.