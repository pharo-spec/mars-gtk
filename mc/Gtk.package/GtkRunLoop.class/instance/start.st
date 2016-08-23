running
start
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	session := Smalltalk session. 
	[ [ self isRunning ] 
		whileTrue: [ self processEventsAndWait ] ] 
	forkNamed: 'Gtk run loop'