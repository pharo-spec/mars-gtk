private primitives
gtkSet: button label: label
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_button_set_label ("GtkButton *" void *button, "const gchar *" String label) )