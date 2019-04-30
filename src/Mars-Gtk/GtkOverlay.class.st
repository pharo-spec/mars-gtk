"
GtkOverlay — A container which overlays widgets on top of each other

https://developer.gnome.org/gtk3/stable/GtkOverlay.html
"
Class {
	#name : #GtkOverlay,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'instance  creation' }
GtkOverlay class >> new [

	^ self overlayNew initialize
]

{ #category : #private }
GtkOverlay class >> overlayNew [

	^ self ffiCall: #(GtkOverlay *gtk_overlay_new  (void))
]

{ #category : #adding }
GtkOverlay >> add: widget [

	self keepWidget: widget.
	self basicAdd: widget.

	^ widget
]

{ #category : #adding }
GtkOverlay >> addOverlay: aWidget [

	self keepWidget: aWidget.
	self basicAddOverlay: aWidget.
]

{ #category : #adding }
GtkOverlay >> basicAddOverlay: aWidget [

	^ self ffiCall: #(void gtk_overlay_add_overlay (self, GtkWidget *aWidget))
]
