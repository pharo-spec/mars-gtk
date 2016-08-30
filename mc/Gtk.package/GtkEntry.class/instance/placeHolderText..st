accessing
placeHolderText: text
	self ffiCall: #(void gtk_entry_set_placeholder_text (self, const gchar *text))