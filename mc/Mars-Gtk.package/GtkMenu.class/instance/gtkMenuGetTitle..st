private primitives
gtkMenuGetTitle: menu
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #("const gchar *" String gtk_menu_get_title ("GtkMenu *" void *menu ) )