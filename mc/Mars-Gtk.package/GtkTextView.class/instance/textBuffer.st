accessing
textBuffer
	self ffiCall: #(GtkTextBuffer *gtk_text_view_get_buffer (self))