accessing
alwaysShowImage: always_show
	^ self ffiCall: #(void gtk_button_set_always_show_image (self, gboolean always_show))