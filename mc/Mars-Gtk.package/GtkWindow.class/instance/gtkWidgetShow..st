private primitives
gtkWidgetShow: widget
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_widget_show ( "GtkWidget *" void *widget ) )