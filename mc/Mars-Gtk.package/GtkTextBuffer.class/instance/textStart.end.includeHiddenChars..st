private
textStart: start end: end includeHiddenChars: include_hidden_chars 
	self ffiCall: #(gchar *gtk_text_buffer_get_text (
		self,
      "const GtkTextIter *" void *start,
      "const GtkTextIter *" void *end,
      gboolean include_hidden_chars))