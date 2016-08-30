private
loadFromPath: path error: error
	^ self ffiCall: #(gboolean gtk_css_provider_load_from_path (
		self, 
		const gchar *path,
		0))