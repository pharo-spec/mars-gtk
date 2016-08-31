private
entryNew
	^ self ffiCall: #(GtkEntry *gtk_entry_new ())