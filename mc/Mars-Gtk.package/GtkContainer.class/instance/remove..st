accessing
remove: widget
	self basicRemove: widget.
	children := children copyWithout: widget.
	widget autoRelease