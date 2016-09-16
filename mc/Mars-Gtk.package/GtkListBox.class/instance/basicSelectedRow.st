private
basicSelectedRow
	"Answer void* because I use it as address, to find the row I already have"
	^ self ffiCall: #("GtkListBoxRow *" void *gtk_list_box_get_selected_row (self))