private primitives
gtkBox: box packStart: child expand: expand fill: fill padding: padding
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self 
		nbCall: #( void gtk_box_pack_start (
		"GtkBox *"		void *box,
		"GtkWidget *"	void *child,
		"gboolean" 		Boolean expand,
		"gboolean" 		Boolean fill,
		"guint" 			uint padding ))
		options: #( coerceBoolToInt )