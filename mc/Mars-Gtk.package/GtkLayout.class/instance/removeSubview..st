accessing
removeSubview: aView
	self gtkContainer: self panelHandle remove: aView handle.
	^ aView