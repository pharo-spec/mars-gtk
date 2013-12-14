running
start 
	self isRunning ifTrue: [ ^ self ].
	self startRunLoop.