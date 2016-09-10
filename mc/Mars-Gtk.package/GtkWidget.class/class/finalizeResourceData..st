finalization
finalizeResourceData: widget
	(widget isNil or: [ widget isNull ]) ifTrue: [ ^ self ].
	GtkFinalizeSignal logTarget: self handle: widget.
	self widgetDestroy: widget