private primitives
gtkWidgetHide: widget
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_widget_hide ( "GtkWidget *" void *widget ) )