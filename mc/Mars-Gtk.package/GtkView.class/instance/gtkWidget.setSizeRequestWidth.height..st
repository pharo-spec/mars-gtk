private primitives
gtkWidget: widget setSizeRequestWidth: width height: height
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	self flag: #todo. "I'm not sure this has to be here. I would check if it shouldn't have in 
	a 'layout' object"
	self nbCall: #( void gtk_widget_set_size_request ("GtkWidget *" void *widget, int width, int height ) ).