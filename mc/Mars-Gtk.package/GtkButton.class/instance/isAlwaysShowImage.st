testing
isAlwaysShowImage
	^ self ffiCall: #(void gtk_button_get_always_show_image (self))