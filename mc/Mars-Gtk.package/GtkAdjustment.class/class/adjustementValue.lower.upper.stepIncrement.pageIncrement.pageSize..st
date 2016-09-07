private
adjustementValue: value lower: lower upper: upper stepIncrement: step_increment pageIncrement: page_increment pageSize: page_size  
	^ self ffiCall: #(GtkAdjustment *gtk_adjustment_new (
		gdouble value,
		gdouble lower,
		gdouble upper,
		gdouble step_increment,
 		gdouble page_increment,
		gdouble page_size))