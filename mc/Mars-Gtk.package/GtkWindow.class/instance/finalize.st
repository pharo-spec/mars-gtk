finalization
finalize
	self getHandle isNull ifTrue: [ ^ self ].
	self disconnectAll.
	self class widgetDestroy: self getHandle