finalization
finalize
	finalizeMutex critical: [
		(self getHandle isNil or: [ self getHandle isNull ]) ifTrue: [ ^ self ].
		GtkFinalizeSignal emitTarget: self handle: self getHandle.
		self disconnectAll.
		"It may have changed after all disconnections (some disconnect may trigger a 
		 destroy, I'm not sure how this works...)"
		self getHandle ifNotNil: [ self class widgetDestroy: self getHandle ] ]