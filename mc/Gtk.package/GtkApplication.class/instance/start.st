running
start 
	self isRunning ifTrue: [ self stop ].
	self initGtk3.
	runLoop start