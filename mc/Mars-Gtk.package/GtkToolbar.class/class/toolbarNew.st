private
toolbarNew
	^ self ffiCall: #(GtkToolbar *gtk_toolbar_new (void))