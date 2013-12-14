private
stopRunLoop
	runLoop ifNil: [ ^ self ].
	runLoop stop.