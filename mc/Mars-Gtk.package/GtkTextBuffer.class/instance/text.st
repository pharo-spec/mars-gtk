accessing
text
	self ffiCall: #(gchar *gtk_text_buffer_get_text (
		self,
      "const GtkTextIter *start" 0,
      "const GtkTextIter *end" 0,
      "gboolean include_hidden_chars" 1))