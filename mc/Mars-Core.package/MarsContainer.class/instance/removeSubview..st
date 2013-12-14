private
removeSubview: aView 
	aView superview: nil.
	subviews := subviews copyWithout: aView.