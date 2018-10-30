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

{ #category : #accessing }
GtkDrawingArea >> allocation [
	| allocation |
	
	allocation := GtkAllocation new.
	self getAllocation: allocation.
	^ allocation asRectangle
]

{ #category : #private }
GtkDrawingArea >> basicDraw: cr [
	"I need to be sure this process will not be highjacked by another 
	 so I need to execute it unpreemptively (otherwise it will crash 
	 the vm)"
	"[ "self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr)" ] valueUnpreemptively"		
]

{ #category : #drawing }
GtkDrawingArea >> drawOnAthensCanvas: aCanvas [
	self subclassResponsibility
]

{ #category : #private }
GtkDrawingArea >> getAllocatedHeight [
	^ self ffiCall: #(int gtk_widget_get_allocated_height (self))
]

{ #category : #private }
GtkDrawingArea >> getAllocatedWidth [
	^ self ffiCall: #(int gtk_widget_get_allocated_width (self))
]

{ #category : #private }
GtkDrawingArea >> getAllocation: allocation [

	self ffiCall: #(void gtk_widget_get_allocation (self, GtkAllocation *allocation))
	
]

{ #category : #initialization }
GtkDrawingArea >> initialize [
	super initialize.
	drawing := false.
	self 
		connect: 'draw' 
		signature: #( int (void *widget, void *cr, void *payload) ) 
		do: [ :widget :cr :payload |
			self basicDraw: cr.
			0 ]
]

{ #category : #drawing }
GtkDrawingArea >> positionInTopLevel [

	^ self 
		translateCoordinates: 0@0
		to: self parentWindow
]

{ #category : #private }
GtkDrawingArea >> setSizeRequestWidth: width height: height [
	
	self ffiCall: #(void gtk_widget_set_size_request (self, gint width, gint height))
]
