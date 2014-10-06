accessing
addSubview: aView 
	self layout addSubview: aView.
	self gtkWidgetShow: aView handle.
	^ aView