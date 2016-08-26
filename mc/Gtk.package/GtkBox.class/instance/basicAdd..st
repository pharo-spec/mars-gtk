private
basicAdd: child
	"void gtk_box_pack_start (GtkBox *box, GtkWidget *child, gboolean expand, gboolean fill, guint padding)"
	^ self ffiCall: #(void gtk_box_pack_start (self, GtkWidget child, 1, 1, 1))