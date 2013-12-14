running
start
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	[ [ self isRunning ] 
		whileTrue: [ self processEventsAndWait ] ] 
	forkNamed: 'Gtk run loop'.
