private
basicInsert: child at: position
	self ffiCall: #(void gtk_list_box_insert (self, GtkWidget child, gint position))