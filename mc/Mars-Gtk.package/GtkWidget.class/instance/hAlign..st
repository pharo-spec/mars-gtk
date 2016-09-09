accessing
hAlign: align
	^ self ffiCall: #(void gtk_widget_set_halign (self, GtkAlign align))