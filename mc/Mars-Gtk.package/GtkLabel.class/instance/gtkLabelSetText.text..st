private primitives
gtkLabelSetText: widget text: str
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	^ self nbCall: #( void gtk_label_set_text ("GtkLabel *" void *widget, String str ) )