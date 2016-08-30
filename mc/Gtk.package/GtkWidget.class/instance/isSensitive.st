testing
isSensitive
	"Returns the widget’s effective sensitivity, which means it is sensitive itself and also its parent widget is sensitive"
	^ self ffiCall: #(gboolean gtk_widget_is_sensitive (self))