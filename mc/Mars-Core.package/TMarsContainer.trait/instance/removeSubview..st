accessing
removeSubview: aView 
	aView superview: nil.
	^ self basicRemoveSubview: aView