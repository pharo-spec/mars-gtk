accessing
imagePosition: position
	^ self ffiCall: #(void gtk_button_set_image_position (self, GtkPositionType position))