private
startIter: iter
	self ffiCall: #(void gtk_text_buffer_get_start_iter (self, "GtkTextIter *"void **iter))