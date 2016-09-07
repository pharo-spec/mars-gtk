accessing
hAlign
	^ self ffiCall: #(GtkAlign gtk_widget_get_halign (self))