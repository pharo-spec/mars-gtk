accessing
text: text
	self ffiCall: #(void gtk_entry_set_text (self, const gchar *text))