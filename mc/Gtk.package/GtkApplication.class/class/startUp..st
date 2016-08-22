system startup
startUp: resuming
	resuming ifFalse: [ ^ self ].
	self uniqueInstance startUp