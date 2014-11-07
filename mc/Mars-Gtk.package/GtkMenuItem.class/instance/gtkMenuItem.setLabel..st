private primitives
gtkMenuItem: menuItem setLabel: label
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( void gtk_menu_item_set_label ("GtkMenuItem *" void *menuItem, "const gchar *" String label ) )