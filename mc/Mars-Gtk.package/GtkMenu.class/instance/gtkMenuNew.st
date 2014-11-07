private primitives
gtkMenuNew
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( "GtkWidget *" void *gtk_menu_new ( void ) )