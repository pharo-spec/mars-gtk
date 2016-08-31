accessing
modal: modal
	self ffiCall: #(void gtk_window_set_modal (self, gboolean modal))