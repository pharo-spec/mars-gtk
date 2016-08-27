private
basicPackStart: child expand: expand fill: fill padding: padding 
	^ self ffiCall: #(void gtk_box_pack_start (
		self, 
		GtkWidget child, 
		gboolean expand, 
		gboolean fill, 
		guint padding))