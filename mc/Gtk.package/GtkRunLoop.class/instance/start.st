running
start
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	session := Smalltalk session. 
	[ [ self isRunning ] 
		whileTrue: [ 
			self checkSession 
				ifTrue: [ self processEventsAndWait ]
				ifFalse: [ self stop ] ] ] 
	forkNamed: 'Gtk run loop'