accessing
pack1: child resize: resize shrink: shrink 
	^ self ffiCall: #(void gtk_paned_pack1 (self, GtkWidget *child, gboolean resize, gboolean shrink))