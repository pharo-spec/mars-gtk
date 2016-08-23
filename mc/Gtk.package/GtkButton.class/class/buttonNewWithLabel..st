private
buttonNewWithLabel: label
	^ self ffiCall: #(GtkButton *gtk_button_new_with_label (const gchar *label))