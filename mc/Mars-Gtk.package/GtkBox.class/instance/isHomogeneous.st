testing
isHomogeneous
	self ffiCall: #(gboolean gtk_box_get_homogeneous (self)) 