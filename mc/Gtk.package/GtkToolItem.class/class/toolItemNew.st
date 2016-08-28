private
toolItemNew
	^ self ffiCall: #(GtkToolItem *gtk_tool_item_new (void))