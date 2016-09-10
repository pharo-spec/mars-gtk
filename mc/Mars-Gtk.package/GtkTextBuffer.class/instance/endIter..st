private
endIter: iter
	self ffiCall: #(void gtk_text_buffer_get_end_iter (self, "GtkTextIter *"void **iter))