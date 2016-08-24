private
getAllocatedWidth
	^ self ffiCall: #(int gtk_widget_get_allocated_width (self))