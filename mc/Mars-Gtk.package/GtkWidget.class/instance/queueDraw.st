as yet unclassified
queueDraw
	^ self ffiCall: #(void gtk_widget_queue_draw (self))