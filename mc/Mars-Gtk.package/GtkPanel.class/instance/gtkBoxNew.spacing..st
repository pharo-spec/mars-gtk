private
gtkBoxNew: orientation spacing: spacing
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( "GtkWidget *" coid *gtk_box_new ( "GtkOrientation" uint orientation, int spacing ) )