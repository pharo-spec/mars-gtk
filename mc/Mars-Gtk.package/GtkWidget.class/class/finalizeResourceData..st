finalization
finalizeResourceData: widget
	(widget isNil or: [ widget isNull ]) ifTrue: [ ^ self ].
	GtkFinalizeSignal emitTarget: self handle: widget.
	self widgetDestroy: widget