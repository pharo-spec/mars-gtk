finalization
finalize
	(self getHandle isNil or: [ self getHandle isNull ]) ifTrue: [ ^ self ].
	self disconnectAll.
	self class widgetDestroy: self getHandle