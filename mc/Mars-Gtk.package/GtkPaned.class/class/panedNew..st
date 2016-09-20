private
panedNew: orientation
	^ self ffiCall: #(GtkPaned *gtk_paned_new (GtkOrientation orientation))