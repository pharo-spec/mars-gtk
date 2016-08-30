testing
isVisible
	^ self ffiCall: #(gboolean gtk_widget_is_visible (self))