accessing
setPosition: position
	"This is how it will be positioned WHEN showing (not after)"
	self ffiCall: #(void gtk_window_set_position ( self, GtkWindowPosition position ) )