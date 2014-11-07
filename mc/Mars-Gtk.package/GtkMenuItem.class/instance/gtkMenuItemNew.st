private primitives
gtkMenuItemNew
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( "GtkWidget *" void *gtk_menu_item_new ( void ) )