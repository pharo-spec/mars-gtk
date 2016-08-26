running
start 
	self isRunning ifTrue: [ self stop ].
	self initGtk3.
	(runLoop := GtkRunLoop new) start