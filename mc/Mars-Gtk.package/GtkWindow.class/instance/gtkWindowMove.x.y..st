private primitives
gtkWindowMove: window x: x y: y
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_window_move ("GtkWindow *" void *window, int x, int y) )	