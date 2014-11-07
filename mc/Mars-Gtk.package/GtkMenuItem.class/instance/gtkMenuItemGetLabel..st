private primitives
gtkMenuItemGetLabel: menuItem
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( "const gchar *" String gtk_menu_item_get_label ("GtkMenuItem *" void *menuItem ) )