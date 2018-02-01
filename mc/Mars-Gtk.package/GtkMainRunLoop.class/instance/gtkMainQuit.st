private installing
gtkMainQuit
	self ffiCall: #(void gtk_main_quit ())