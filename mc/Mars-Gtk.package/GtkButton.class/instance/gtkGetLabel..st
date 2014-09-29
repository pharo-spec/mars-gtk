private primitives
gtkGetLabel: button
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( "const gchar *" String gtk_button_get_label ("GtkButton *" void *button ) )