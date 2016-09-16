private
typeFromName: name
	^ self ffiCall: #(GType g_type_from_name (const gchar *name))