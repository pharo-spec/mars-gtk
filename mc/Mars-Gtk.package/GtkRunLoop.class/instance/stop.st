running
stop 
	self isRunning ifFalse: [ ^ self ].
	self setDefaultEventsHandler.
	runLoop := nil.
	running := false
