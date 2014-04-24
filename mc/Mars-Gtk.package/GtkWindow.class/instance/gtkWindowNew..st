private primitives
gtkWindowNew: type
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( "GtkWidget *" void *gtk_window_new ("GtkWindowType" int type) )