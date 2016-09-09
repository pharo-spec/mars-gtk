accessing
vAlign: align
	^ self ffiCall: #(void gtk_widget_set_valign (self, GtkAlign align))