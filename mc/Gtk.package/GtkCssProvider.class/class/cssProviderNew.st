private
cssProviderNew
	^ self ffiCall: #(GtkCssProvider *gtk_css_provider_new (void))
	