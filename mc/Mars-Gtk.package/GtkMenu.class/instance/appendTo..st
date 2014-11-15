accessing
appendTo: aView 
	self 
		gtkMenuItem: aView handle 
		setSubmenu: self handle