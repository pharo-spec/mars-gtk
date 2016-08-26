private
widgetPathLength: path_length path: path reversed: path_reversed
	^ self ffiCall: #(void gtk_widget_path (self, guint *path_length, gchar **path, gchar **path_reversed))