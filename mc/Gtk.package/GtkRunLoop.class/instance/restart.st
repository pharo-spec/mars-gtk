running
restart
	self isRunning ifTrue: [ ^ self ].

	delay := Delay forMilliseconds: self millisecondsToWait.
	self start