private
loadFromPath: css_provider path: path error: error
	^ self ffiCall: #(gboolean gtk_css_provider_load_from_path (
		void **css_provider, 
		const gchar *path,
		GError *error))