private primitives
gtkLabelNew: str
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self 
		nbCall: #( "GtkWidget *" void *gtk_label_new ( String str ) ) 
		options: #( optStringOrNull )