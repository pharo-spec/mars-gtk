Class {
	#name : #GtkAccelGroup,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #private }
GtkAccelGroup class >> accelGroupNew [

	^ self ffiCall: #(GtkAccelGroup *gtk_accel_group_new (void))
]

{ #category : #'instance creation' }
GtkAccelGroup class >> new [

	^ self accelGroupNew initialize
]
