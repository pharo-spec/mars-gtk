private
notebookNew
	^ self ffiCall: #(GtkNotebook *gtk_notebook_new (void))