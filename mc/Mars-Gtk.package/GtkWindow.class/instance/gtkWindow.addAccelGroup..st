private primitives
gtkWindow: window addAccelGroup: accel_group
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_window_add_accel_group (
		"GtkWindow *"		void *window,
		"GtkAccelGroup *"	void *accel_group) )