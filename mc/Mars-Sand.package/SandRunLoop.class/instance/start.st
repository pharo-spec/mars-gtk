running
start
	running := true.
	[ [ self isRunning ] 
	  whileTrue: [ self processEventsAndWait ] ]
	forkNamed: 'Coffee run loop'