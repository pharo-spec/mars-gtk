running
stop
	self application windowsDo: #finalize.
	self stopRunLoop.