accessing
spacing: 	spacing
		^ self ffiCall: #(void gtk_box_set_spacing (self, gint spacing))