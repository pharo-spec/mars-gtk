private
labelNew: str
	^ self ffiCall: #(GtkLabel *gtk_label_new (const gchar *str))