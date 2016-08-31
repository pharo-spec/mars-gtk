accessing
draw: draw
	^ self ffiCall: #(void gtk_separator_tool_item_set_draw (self, gboolean draw))