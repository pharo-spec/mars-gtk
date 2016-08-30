running
start
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	session := Smalltalk session. 
	runLoop := FFICallback 
		signature: #(void (void)) 
		block: [ self processEvents ].
	self setEventsHandler: runLoop