private
remove: aView
	self platformView removeSubview: aView platformView.
	items := items copyWithout: aView.
	^ aView