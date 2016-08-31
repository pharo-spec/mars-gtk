private
listBoxNew
	^ self ffiCall: #(GtkListBox *gtk_list_box_new (void))