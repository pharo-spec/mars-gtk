accessing
text
	^ self ffiCall: #(const gchar *gtk_label_get_text (self))