private
listBoxRowNew
	^ self ffiCall: #(GtkListBoxRow *gtk_list_box_new (void))