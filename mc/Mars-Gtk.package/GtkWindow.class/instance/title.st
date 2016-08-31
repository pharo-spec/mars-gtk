accessing
title 
	^ self ffiCall: #(const gchar *gtk_window_get_title (self))