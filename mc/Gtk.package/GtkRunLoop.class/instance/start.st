running
start
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	session := Smalltalk session. 
	runLoop := [ self runLoop ] newProcess
		priority: Processor userSchedulingPriority;
		name: 'Gtk run loop';
		resume