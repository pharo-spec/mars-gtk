testing
isDraw
	^ self ffiCall: #(gboolean gtk_separator_tool_item_get_draw (self))