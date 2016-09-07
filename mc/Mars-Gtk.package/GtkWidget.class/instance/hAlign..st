accessing
hAlign: align
	^ self ffiCall: #(GtkAlign gtk_widget_set_halign (self, GtkAlign align))