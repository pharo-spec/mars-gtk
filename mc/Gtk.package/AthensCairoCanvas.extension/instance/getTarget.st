*Gtk
getTarget
	^ self ffiCall: #( cairo_surface_t * cairo_get_target ( self ) )