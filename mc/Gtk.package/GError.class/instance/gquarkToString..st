private
gquarkToString: quark
	^ self ffiCall: #(const gchar *g_quark_to_string (GQuark quark))