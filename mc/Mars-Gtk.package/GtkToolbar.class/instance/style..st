accessing
style: style
	^ self ffiCall: #(void gtk_toolbar_set_style (self, GtkToolbarStyle style))