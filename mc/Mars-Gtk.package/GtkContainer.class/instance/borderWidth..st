accessing
borderWidth: border_width
	self ffiCall: #(void gtk_container_set_border_width (self, guint border_width))