private
windowNew: type 
	^ self ffiCall: #( GtkWindow *gtk_window_new ( GtkWindowType type ) )