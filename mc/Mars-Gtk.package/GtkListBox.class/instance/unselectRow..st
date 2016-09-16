accessing
unselectRow: row
	self ffiCall: #(void gtk_list_box_unselect_row (self, GtkListBoxRow *row))