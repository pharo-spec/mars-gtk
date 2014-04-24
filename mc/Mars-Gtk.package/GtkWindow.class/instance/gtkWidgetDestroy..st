private primitives
gtkWidgetDestroy: widget
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_widget_destroy ("GtkWidget *" void *widget) )	