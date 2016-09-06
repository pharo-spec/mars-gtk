accessing
text: text
	self ffiCall: #(void gtk_text_buffer_set_text (self, const gchar *text, "gint len" -1))