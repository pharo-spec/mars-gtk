private
processEvents
	[
		[ (self isRunning and: [ self checkSession ])
			ifTrue: [ self getEventsPending ]
			ifFalse: [ false ] ]
		whileTrue: [ self mainIterationDo: false ] ]
	on: Exception fork: [ :e | e debug ]