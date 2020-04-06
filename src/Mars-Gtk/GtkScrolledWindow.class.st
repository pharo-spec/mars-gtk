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

{ #category : #accessing }
GtkScrolledWindow >> hAdjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_scrolled_window_get_hadjustment (self))
]

{ #category : #accessing }
GtkScrolledWindow >> hAdjustment: adjustment [

	^ self ffiCall: #(void gtk_scrolled_window_set_hadjustment (self, GtkAdjustment *adjustment))
]

{ #category : #testing }
GtkScrolledWindow >> isKineticScrolling [

	^ self ffiCall: #(gboolean gtk_scrolled_window_get_kinetic_scrolling(self))
]

{ #category : #accessing }
GtkScrolledWindow >> kineticScrolling: kinetic_scrolling [

	^ self ffiCall: #(void gtk_scrolled_window_set_kinetic_scrolling (self, gboolean kinetic_scrolling))
]

{ #category : #accessing }
GtkScrolledWindow >> propagateNaturalHeight: propagate [

	^ self ffiCall: #(void gtk_scrolled_window_set_propagate_natural_height(
		self,
		gboolean propagate))
]

{ #category : #accessing }
GtkScrolledWindow >> propagateNaturalWidth: propagate [

	^ self ffiCall: #(void gtk_scrolled_window_set_propagate_natural_width(
		self,
		gboolean propagate))
]

{ #category : #accessing }
GtkScrolledWindow >> vAdjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_scrolled_window_get_vadjustment (self))
]

{ #category : #accessing }
GtkScrolledWindow >> vAdjustment: adjustment [

	^ self ffiCall: #(void gtk_scrolled_window_set_vadjustment (self, GtkAdjustment *adjustment))
]
