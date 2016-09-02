private
keepWidget: widget
	widget retain. 
	children := children copyWith: widget.

