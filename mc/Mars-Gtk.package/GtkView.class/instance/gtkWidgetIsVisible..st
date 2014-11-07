private primitives
gtkWidgetIsVisible: widget
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( Boolean gtk_widget_is_visible ("GtkWidget *" void *widget ) )