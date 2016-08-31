testing
isFocus
	^ self ffiCall: #(gboolean gtk_widget_is_focus (self))