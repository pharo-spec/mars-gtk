private primitives
gtkAccelGroupNew
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( "GtkAccelGroup *" void *gtk_accel_group_new ( void ) )	