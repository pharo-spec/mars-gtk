running
start
	running := true.
	[ [ self isRunning ] 
	  whileTrue: [ self processEventsAndWait ] ]
	forkNamed: 'Sand run loop'