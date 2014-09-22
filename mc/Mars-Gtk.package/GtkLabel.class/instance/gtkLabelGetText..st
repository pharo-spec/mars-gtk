private primitives
gtkLabelGetText: widget
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( String gtk_label_get_text ( "GtkLabel *" void *widget ) )