running
stop
	self isRunning ifFalse: [ ^ self ].
	runLoop stop