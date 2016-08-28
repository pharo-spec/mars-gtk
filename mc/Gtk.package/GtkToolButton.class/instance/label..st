accessing
label: label
	^ self ffiCall: #(void gtk_tool_button_set_label (self, const gchar *label))