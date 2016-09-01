accessing
borderWidth
	^ self ffiCall: #(guint gtk_container_get_border_width (self))