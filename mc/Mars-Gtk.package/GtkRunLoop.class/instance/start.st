running
start
	self isRunning ifTrue: [ ^ self ].
	
	running := true.
	session := Smalltalk session. 
	self installRunLoop.