"
I'm a widget for custom user interface elements.

https://developer.gnome.org/gtk3/stable/GtkDrawingArea.html
"
Class {
	#name : #GtkDrawingArea,
	#superclass : #GtkWidget,
	#instVars : [
		'drawing'
	],
	#category : 'Mars-Gtk-Widget'
}

{ #category : #private }
GtkDrawingArea class >> drawingAreaNew [
	^ self ffiCall: #( GtkDrawingArea *gtk_drawing_area_new () )
]

{ #category : #'instance creation' }
GtkDrawingArea class >> new [
	^ self drawingAreaNew initialize
]

{ #category : #drawing }
GtkDrawingArea >> drawOnAthensCanvas: aCanvas [
	self subclassResponsibility
]

{ #category : #initialization }
GtkDrawingArea >> initialize [
	super initialize.
	drawing := false.
	self 
		connect: 'draw' 
		signature: #( int (void *widget, void *cr, void *payload) ) 
		do: [ :widget :cr :payload |
			"I need to be sure this process will not be highjacked by another 
			 so I need to execute it unpreemptively (otherwise it will crash 
			 the vm)"
			"[ "self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr)" ] valueUnpreemptively".
			0 ]
]
