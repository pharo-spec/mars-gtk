accessing
iconSize: icon_size
	^ self ffiCall: #(void gtk_toolbar_set_icon_size (self, GtkIconSize icon_size))