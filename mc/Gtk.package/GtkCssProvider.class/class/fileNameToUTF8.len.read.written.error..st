private
fileNameToUTF8: opsysstring len: len read: bytes_read written: bytes_written error: error
	self ffiCall: #(gchar *g_filename_to_utf8 (
		const gchar *opsysstring,
		gssize len,
		gsize *bytes_read,
		gsize *bytes_written,
		GError *error))