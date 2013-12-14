initialization
initialize 
	super initialize.
	runLoop := GtkRunLoop new.
	self gtkInit.