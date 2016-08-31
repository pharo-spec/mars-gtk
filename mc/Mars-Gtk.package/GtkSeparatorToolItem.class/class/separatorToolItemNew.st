private
separatorToolItemNew
	^ self ffiCall: #(GtkSeparatorToolItem *gtk_separator_tool_item_new (void))