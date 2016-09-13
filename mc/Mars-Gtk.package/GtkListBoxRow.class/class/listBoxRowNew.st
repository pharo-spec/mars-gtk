private
listBoxRowNew
	^ self ffiCall: #(GtkListBoxRow *gtk_list_box_row_new (void))