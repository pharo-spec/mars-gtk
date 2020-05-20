"
GtkEventBox
GtkEventBox — A widget used to catch events for widgets which do not have their own window

https://developer.gnome.org/gtk3/stable/GtkEventBox.html
"
Class {
	#name : #GtkEventBox,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'as yet unclassified' }
GtkEventBox class >> eventBoxNew [

	^ self ffiCall: #(GtkEventBox *gtk_event_box_new (void))
]

{ #category : #'instance creation' }
GtkEventBox class >> new [

	^ self eventBoxNew initialize
]
