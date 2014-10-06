private primitives
gtkContainer: container foreach: callback data: data
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self 
		nbCall: #( void gtk_container_foreach (
			"GtkContainer *" 	void *container,
			"GtkCallback" 		void *callback,
			"gpointer" 			void *data))
		module: GtkLibrary libraryHandle
		options: #( optCoerceNilToNull )
		