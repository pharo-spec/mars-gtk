private primitives
gtkMenuItem: menu_item setSubmenu: submenu
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( void gtk_menu_item_set_submenu ("GtkMenuItem *" void *menu_item, "GtkWidget *" void *submenu) )