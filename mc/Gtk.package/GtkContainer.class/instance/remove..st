accessing
remove: widget
	self basicRemove: widget.
	widgets := widgets copyWithout: widget