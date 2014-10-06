private primitives
gtkContainer: container remove: widget
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_container_remove ("GtkContainer *" void *container, "GtkWidget *" void *widget))