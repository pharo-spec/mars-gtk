private primitives
gtkMenu: menu setTitle: title
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( void gtk_menu_set_title ("GtkMenu *" void *menu, const "gchar *" String title ) )