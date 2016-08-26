private
overrideBackgroundState: state color: color
	^ self ffiCall: #(void gtk_widget_override_background_color (self, GtkStateFlags state, const GdkRGBA *color))