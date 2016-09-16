private
toolButtonNew: icon_widget label: label 
	^ self ffiCall: #(GtkToolButton *gtk_tool_button_new (
		GtkWidget *icon_widget,
		const gchar *label))