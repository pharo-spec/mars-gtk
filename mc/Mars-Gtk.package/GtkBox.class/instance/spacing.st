accessing
spacing
		^ self ffiCall: #(gint gtk_box_get_spacing (self))