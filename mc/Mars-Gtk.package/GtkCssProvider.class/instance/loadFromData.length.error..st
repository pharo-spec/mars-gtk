private
loadFromData: data length: length error: error
	^ self ffiCall: #(gboolean gtk_css_provider_load_from_data (
		self,
		const gchar *data,
		gssize length,
		GError *error))