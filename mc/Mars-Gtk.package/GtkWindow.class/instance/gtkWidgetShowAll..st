private primitives
gtkWidgetShowAll: widget
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void gtk_widget_show_all ( "GtkWidget *" void *widget ) )