private
processEvents
	self doNotOverlap: [
		[ (self isRunning and: [ self checkSession ])
			ifTrue: [ self getEventsPending ]
			ifFalse: [ false ] ]
		whileTrue: [ self mainIterationDo: false ] ] 