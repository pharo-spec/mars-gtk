"
A GtkAccelGroup represents a group of keyboard accelerators, typically attached to a toplevel GtkWindow (with gtk_window_add_accel_group()). Usually you won’t need to create a GtkAccelGroup directly; instead, when using GtkUIManager, GTK+ automatically sets up the accelerators for your menus in the ui manager’s GtkAccelGroup.

https://developer.gnome.org/gtk3/stable/gtk3-Keyboard-Accelerators.html#GtkAccelGroup
"
Class {
	#name : #GtkAccelGroup,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #private }
GtkAccelGroup class >> accelGroupNew [

	^ self ffiCall: #(GtkAccelGroup *gtk_accel_group_new (void))
]

{ #category : #accessing }
GtkAccelGroup class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_accel_group_init(void *object))
]

{ #category : #accessing }
GtkAccelGroup class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_accel_group_get_type())
]

{ #category : #'instance creation' }
GtkAccelGroup class >> new [

	^ self accelGroupNew initialize
]
