accessing
homogeneous: homogeneous
	self ffiCall: #(void gtk_box_set_homogeneous (self, gboolean homogeneous)) 