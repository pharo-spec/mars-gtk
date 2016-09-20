accessing
pack2: child resize: resize shrink: shrink 
	^ self ffiCall: #(void gtk_paned_pack2 (self, GtkWidget *child, gboolean resize, gboolean shrink))