private
scrolledWindowNewHAdjustment: hadjustment vAdjustment: vadjustment 
	^ self ffiCall: #(GtkScrolledWindow *gtk_scrolled_window_new (
		GtkAdjustment *hadjustment,
		GtkAdjustment *vadjustment))