private
boxNewOrientation: orientation spacing: spacing
	^ self ffiCall: #(GtkBox *gtk_box_new (GtkOrientation orientation, gint spacing))