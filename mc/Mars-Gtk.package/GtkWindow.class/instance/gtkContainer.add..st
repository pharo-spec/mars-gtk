private primitives
gtkContainer: container add: widget
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_container_add (
		"GtkContainer *" 	void *container, 
		"GtkWidget *" 		void * widget) )