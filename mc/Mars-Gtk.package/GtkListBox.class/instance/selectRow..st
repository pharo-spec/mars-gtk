accessing
selectRow: aRow
	self ffiCall: #(void gtk_list_box_select_row (self, GtkListBoxRow *row))