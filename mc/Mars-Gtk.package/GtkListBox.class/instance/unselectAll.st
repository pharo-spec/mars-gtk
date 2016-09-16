accessing
unselectAll
	self ffiCall: #(void gtk_list_box_unselect_all (self))