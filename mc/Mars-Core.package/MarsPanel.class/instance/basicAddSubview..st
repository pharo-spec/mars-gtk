private
basicAddSubview: aView
	self platformView addSubview: aView platformView.
	subviews := subviews copyWith: aView
	