accessing
image 
	^ self ffiCall: #(GtkImage *gtk_button_get_image (self))