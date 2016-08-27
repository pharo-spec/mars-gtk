converting
asString 
	^ self ffiCall: #( gchar *gdk_rgba_to_string ( self ) )