Class {
	#name : #GtkOverlay,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'as yet unclassified' }
GtkOverlay class >> new [

	^ self overlayNew initialize
]

{ #category : #'as yet unclassified' }
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
