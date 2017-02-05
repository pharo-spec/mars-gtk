private installing
installRunLoop
	runLoop := FFICallback 
		signature: #(void (void)) 
		block: [self processEvents].
	self setEventsHandler: runLoop