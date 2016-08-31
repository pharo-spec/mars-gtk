accessing
tooltipText: text
	^ self ffiCall: #(void gtk_tool_item_set_tooltip_text (self, const gchar *text))