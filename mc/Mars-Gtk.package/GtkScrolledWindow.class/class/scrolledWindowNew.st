instance creation
scrolledWindowNew
	^ self ffiCall: #(GtkScrolledWindow *gtk_scrolled_window_new (0, 0))