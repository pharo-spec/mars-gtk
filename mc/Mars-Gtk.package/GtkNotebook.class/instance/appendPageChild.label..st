private
appendPageChild: child label: tab_label
	^ self ffiCall: #(gint gtk_notebook_append_page (self, GtkWidget *child, GtkWidget *tab_label))