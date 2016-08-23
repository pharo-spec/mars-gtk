private
sizeRequestX: x y: y
	^ self ffiCall: #(void gtk_widget_set_size_request ( self, gint width, gint height ) )