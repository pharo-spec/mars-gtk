running
stop
	self isRunning ifFalse: [ ^ self ].
	"self windowsDo: #finalize."
	runLoop stop