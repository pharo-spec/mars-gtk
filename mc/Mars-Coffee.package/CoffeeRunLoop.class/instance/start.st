running
start
	running := true.
	[ [ self isRunning ] 
	  whileTrue: [ self processDamagedAndWait ] ]
	forkNamed: 'Coffee run loop'