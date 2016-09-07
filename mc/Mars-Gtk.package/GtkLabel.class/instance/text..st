accessing
text: str
	^ self ffiCall: #(void gtk_label_set_text (self, const gchar *str))