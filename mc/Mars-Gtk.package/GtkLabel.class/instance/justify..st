private
justify: jtype 
	self ffiCall: #(void gtk_label_set_justify (self, GtkJustification jtype))