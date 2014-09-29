private primitives
gtkButtonNew
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( "GtkWidget *" void *gtk_button_new ( void ) )