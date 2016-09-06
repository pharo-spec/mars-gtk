testing
isEditable
	"Returns the default editability of the GtkTextView. 
	 Tags in the buffer may override this setting for some ranges of text."
	self ffiCall: #(gboolean gtk_text_view_get_editable (self))