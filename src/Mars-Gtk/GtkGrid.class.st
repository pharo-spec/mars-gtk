"
I pack widgets in a rows and columns.

https://developer.gnome.org/gtk3/stable/GtkGrid.html


"
Class {
	#name : #GtkGrid,
	#superclass : #GtkContainer,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #private }
GtkGrid class >> gridNew [
	^ self ffiCall: #(GtkGrid *gtk_grid_new (void))
]

{ #category : #'instance creation' }
GtkGrid class >> new [ 
	^ self gridNew initialize
]

{ #category : #accessing }
GtkGrid >> attach: child at: aPoint [ 
	^ self attach: child left: aPoint x top: aPoint y width: 1 height: 1
]

{ #category : #accessing }
GtkGrid >> attach: child left: left top: top width: width height: height [
	self ffiCall: #(void gtk_grid_attach (
		self, 
		GtkWidget *child, 
		gint left, 
		gint top, 
		gint width, 
		gint height))
]
