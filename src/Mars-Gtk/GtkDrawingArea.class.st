"
I'm a widget for custom user interface elements.

https://developer.gnome.org/gtk3/stable/GtkDrawingArea.html
"
Class {
	#name : #GtkDrawingArea,
	#superclass : #GtkWidget,
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkDrawingArea class >> drawingAreaNew [
	^ self ffiCall: #( GtkDrawingArea *gtk_drawing_area_new () )
]

{ #category : #'instance creation' }
GtkDrawingArea class >> new [
	^ self drawingAreaNew initialize
]

{ #category : #private }
GtkDrawingArea >> basicDraw: cr [
	"I need to be sure this process will not be highjacked by another 
	 so I need to execute it unpreemptively (otherwise it will crash 
	 the vm)"

	self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr)
]

{ #category : #drawing }
GtkDrawingArea >> drawOnAthensCanvas: aCanvas [
	self subclassResponsibility
]

{ #category : #private }
GtkDrawingArea >> extent: aPoint [

	self 
		setSizeRequestWidth: aPoint x 
		height: aPoint y
]

{ #category : #private }
GtkDrawingArea >> getSizeRequest [
	| width height |
	
	width := FFIInt32 newBuffer.
	height := FFIInt32 newBuffer.
	
	self getSizeRequestWidth: width height: height. 
	
	^ (width signedLongAt: 1) @ (height signedLongAt: 1)
]

{ #category : #private }
GtkDrawingArea >> getSizeRequestWidth: width height: height [
	self
		ffiCall: #(void gtk_widget_get_size_request #(self , gint *width , gint *height)).
]

{ #category : #initialization }
GtkDrawingArea >> initialize [

	super initialize.
	self 
		connect: 'draw' 
		signature: #(gboolean (void *widget, void *cr, void *payload) ) 
		do: [ :widget :cr :payload |
			self basicDraw: cr.
			true ]
]

{ #category : #private }
GtkDrawingArea >> setSizeRequestWidth: width height: height [
	
	self ffiCall: #(void gtk_widget_set_size_request #(self , gint width , gint height))
]
