"
I add scrollbars to my child widget (I accept only one)

https://developer.gnome.org/gtk3/stable/GtkScrolledWindow.html
"
Class {
	#name : #GtkScrolledWindow,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget-Container'
}

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
