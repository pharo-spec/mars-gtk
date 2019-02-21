Class {
	#name : #GdkEvent,
	#superclass : #GtkStructure,
	#pools : [
		'GdkEventType'
	],
	#category : #'Mars-Gtk-Base-Events'
}

{ #category : #private }
GdkEvent class >> eventNew: type [

	self ffiCall: #(GdkEvent *gdk_event_new (GdkEventType type))
]

{ #category : #resources }
GdkEvent class >> ffiLibrary [

	^ GtkLibrary 
]

{ #category : #testing }
GdkEvent >> ffiLibrary [

	^ GtkLibrary 
]

{ #category : #testing }
GdkEvent >> free [

	self ffiCall: #(void gdk_event_free (self))
]

{ #category : #testing }
GdkEvent >> isDoubleClick [ 

	^ self type = GDK_2BUTTON_PRESS
	
]
