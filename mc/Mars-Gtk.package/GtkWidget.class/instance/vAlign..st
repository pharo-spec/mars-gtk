accessing
vAlign: align
	^ self ffiCall: #(GtkAlign gtk_widget_set_valign (self, GtkAlign align))