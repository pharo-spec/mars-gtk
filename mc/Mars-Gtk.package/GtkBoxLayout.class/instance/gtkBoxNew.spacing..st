private primitives
gtkBoxNew:  anOrientation spacing: spacing
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( "GtkWidget *" void *gtk_box_new ( "GtkOrientation" uint anOrientation, int spacing ) )