private primitives
gtkWidgetAddAccelerator: widget signal: accel_signal group: accel_group key: accel_key modifiers: accel_mods
flags: accel_flags	
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	self nbCall: #( void gtk_widget_add_accelerator (
		"GtkWidget *"		void *widget,
		"const gchar *"		String accel_signal,
		"GtkAccelGroup *"	void *accel_group,
		"guint"				uint accel_key,
		"GdkModifierType"	uint accel_mods,
		"GtkAccelFlags" 	uint accel_flags ) )