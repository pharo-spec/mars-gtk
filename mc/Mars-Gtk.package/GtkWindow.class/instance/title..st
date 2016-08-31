accessing
title: title
	^ self ffiCall: #(void gtk_window_set_title (self, const gchar *title))