private
buttonNew
	^ self ffiCall: #(GtkButton *gtk_button_new ())