accessing
grabFocus
	self ffiCall: #(void gtk_widget_grab_focus (self))