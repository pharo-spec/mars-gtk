private primitives
gtkWindow: window setTitle: title
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_window_set_title ( void *window, String title ) )