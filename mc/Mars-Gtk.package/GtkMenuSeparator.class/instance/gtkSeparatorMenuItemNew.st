private primitives
gtkSeparatorMenuItemNew
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( "GtkWidget *" void *gtk_separator_menu_item_new ( void ) )