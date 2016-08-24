private
getAllocatedHeight
	^ self ffiCall: #(int gtk_widget_get_allocated_height (self))