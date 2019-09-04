"
I add scrollbars to my child widget (I accept only one)

https://developer.gnome.org/gtk3/stable/GtkScrolledWindow.html
"
Class {
	#name : #GtkScrolledWindow,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #accessing }
GtkScrolledWindow class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_scrolled_window_get_type())
]

{ #category : #'instance creation' }
GtkScrolledWindow class >> new [
	^ self scrolledWindowNew initialize
]

{ #category : #private }
GtkScrolledWindow class >> scrolledWindowNew [
	^ self ffiCall: #(GtkScrolledWindow *gtk_scrolled_window_new (0, 0))
]

{ #category : #private }
GtkScrolledWindow class >> scrolledWindowNewHAdjustment: hadjustment vAdjustment: vadjustment [ 
	^ self ffiCall: #(GtkScrolledWindow *gtk_scrolled_window_new (
		GtkAdjustment *hadjustment,
		GtkAdjustment *vadjustment))
]

{ #category : #'as yet unclassified' }
GtkScrolledWindow >> isKineticScrolling [

	^ self ffiCall: #(gboolean gtk_scrolled_window_get_kinetic_scrolling(self))
]

{ #category : #'as yet unclassified' }
GtkScrolledWindow >> kineticScrolling: kinetic_scrolling [

	^ self ffiCall: #(void gtk_scrolled_window_set_kinetic_scrolling (self, gboolean kinetic_scrolling))
]
