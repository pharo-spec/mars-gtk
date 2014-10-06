accessing
addSubview: aView
	self 
		gtkBox: self panelHandle 
		packStart: aView handle
		expand: true
		fill: true
		padding: 0.
	^ aView
		