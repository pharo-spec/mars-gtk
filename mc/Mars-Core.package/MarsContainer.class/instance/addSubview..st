accessing
addSubview: aView 
	aView superview: self.
	subviews := subviews copyWith: aView