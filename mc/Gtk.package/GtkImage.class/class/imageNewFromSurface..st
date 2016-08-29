private
imageNewFromSurface: surface
	^ self ffiCall: #(GtkWidget *gtk_image_new_from_surface (AthensCairoSurface surface))