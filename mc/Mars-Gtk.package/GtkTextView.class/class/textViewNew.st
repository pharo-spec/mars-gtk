private
textViewNew
	^ self ffiCall: #(GtkTextView *gtk_text_view_new (void))