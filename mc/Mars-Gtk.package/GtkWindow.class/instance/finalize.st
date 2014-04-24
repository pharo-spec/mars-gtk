initialization
finalize
	self handle ifNil: [ ^ self ]. "Already finalized"
	self gtkWidgetDestroy: self handle.
	self handle: nil.