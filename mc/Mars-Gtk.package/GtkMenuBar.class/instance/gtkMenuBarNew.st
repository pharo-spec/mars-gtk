private primitives
gtkMenuBarNew
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( "GtkWidget *" void *gtk_menu_bar_new ( void ) )