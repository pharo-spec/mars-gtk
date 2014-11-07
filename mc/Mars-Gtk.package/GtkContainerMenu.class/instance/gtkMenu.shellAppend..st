private primitives
gtkMenu: menuShell shellAppend: child
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( void gtk_menu_shell_append ("GtkMenuShell *" void *menuShell, "GtkWidget *" void *child) )	