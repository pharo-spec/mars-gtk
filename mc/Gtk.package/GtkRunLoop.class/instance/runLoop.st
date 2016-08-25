private
runLoop
	[ self isRunning ] 
	whileTrue: [ 
		self checkSession 
			ifTrue: [ self processEventsAndWait ]
			ifFalse: [ self stop ] ]