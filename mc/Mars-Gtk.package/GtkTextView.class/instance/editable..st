accessing
editable: setting
	self ffiCall: #(void gtk_text_view_set_editable (self, gboolean setting))