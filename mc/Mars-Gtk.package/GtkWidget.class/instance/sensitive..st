accessing
sensitive: sensitive
	self ffiCall: #(void gtk_widget_set_sensitive (self, gboolean sensitive))