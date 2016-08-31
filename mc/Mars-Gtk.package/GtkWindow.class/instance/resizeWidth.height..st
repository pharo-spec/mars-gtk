private
resizeWidth: width height: height
	^ self ffiCall: #(void gtk_window_resize (self, gint width, gint height))