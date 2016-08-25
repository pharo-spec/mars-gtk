running
start
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	session := Smalltalk session. 
	extraIdleProcess forkAt: Processor userSchedulingPriority named: 'Extra idle process'.
	runLoop forkAt: Processor userSchedulingPriority named: 'Gtk run loop'.