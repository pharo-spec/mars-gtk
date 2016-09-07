accessing
vAlign
	^ self ffiCall: #(GtkAlign gtk_widget_get_valign (self))