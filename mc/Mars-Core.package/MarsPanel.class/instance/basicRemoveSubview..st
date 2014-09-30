private
basicRemoveSubview: aView
	self platformView removeSubview: aView platformView.
	subviews := subviews copyWithout: aView