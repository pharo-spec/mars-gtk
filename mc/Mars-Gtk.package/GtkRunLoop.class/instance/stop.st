running
stop 
	self isRunning ifFalse: [ ^ self ].
	self uninstallRunLoop.	
	running := false
