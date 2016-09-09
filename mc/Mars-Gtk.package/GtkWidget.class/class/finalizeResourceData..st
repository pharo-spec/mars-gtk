finalization
finalizeResourceData: widget
	(widget isNil or: [ widget isNull ]) ifTrue: [ ^ self ].
	self widgetDestroy: widget