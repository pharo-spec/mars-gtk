running
start
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	session := Smalltalk session. 
	runLoop := [ self runLoop ] newProcess
		priority: Processor highIOPriority;
		name: 'Gtk run loop';
		resume