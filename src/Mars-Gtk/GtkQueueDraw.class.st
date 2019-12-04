"
I am a special class made to queue draws (in theory, this can be made outside the main thread). 

"
Class {
	#name : #GtkQueueDraw,
	#superclass : #GtkLibrary,
	#category : #'Mars-Gtk-Base'
}

{ #category : #private }
GtkQueueDraw >> queueDraw: widget [

	^ self ffiCall: #(void gtk_widget_queue_draw (GtkWidget *widget))
]

{ #category : #private }
GtkQueueDraw >> queueDrawArea: widget x: x y: y width: width height: height [

	self ffiCall: #(void gtk_widget_queue_draw_area (
		GtkWidget *widget, 
		gint x, 
		gint y, 
		gint width, 
		gint height))
]

{ #category : #'accessing platform' }
GtkQueueDraw >> runner [

	^ TFSameThreadRunner uniqueInstance
]
