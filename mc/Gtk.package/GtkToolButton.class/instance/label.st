accessing
label
	^ self ffiCall: #(const gchar *gtk_tool_button_get_label (self))