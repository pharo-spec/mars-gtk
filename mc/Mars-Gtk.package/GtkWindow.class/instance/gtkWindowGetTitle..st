private primitives
gtkWindowGetTitle: window
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( "const gchar *" String gtk_window_get_title ( "GtkWindow *" void *window ) )