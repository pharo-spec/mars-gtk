"
I'm a widget for custom user interface elements.

https://developer.gnome.org/gtk3/stable/GtkDrawingArea.html
"
Class {
	#name : #GtkDrawingArea,
	#superclass : #GtkWidget,
	#instVars : [
		'drawing',
		'requestedSize'
	],
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkDrawingArea class >> drawingAreaNew [

	^ self ffiCall: #(GtkDrawingArea *gtk_drawing_area_new ())
]

{ #category : #'instance creation' }
GtkDrawingArea class >> new [
	^ self drawingAreaNew initialize
]

{ #category : #'as yet unclassified' }
GtkDrawingArea >> appPaintable: app_paintable [

	^ self ffiCall: #(void gtk_widget_set_app_paintable (self, gboolean app_paintable))
]

{ #category : #signaling }
GtkDrawingArea >> connectDraw: aBlock [

	^ (GDrawCallback do: aBlock) connectTo: self
	"self eliotConnectDraw: aBlock"
]

{ #category : #private }
GtkDrawingArea >> draw: cr [

	self drawOnAthensCanvas: (AthensCairoCanvas fromHandle: cr).
	^ true
]

{ #category : #drawing }
GtkDrawingArea >> drawOnAthensCanvas: aCanvas [
	self subclassResponsibility
]

{ #category : #signaling }
GtkDrawingArea >> eliotCall: fnSpec [
	"<ffiCalloutTranslator>"
	
	^ (self eliotCalloutIn: thisContext sender)
		convention: self ffiCallingConvention;
		options: #();
		function: fnSpec module: self ffiLibrary uniqueInstance
]

{ #category : #signaling }
GtkDrawingArea >> eliotCalloutIn: aContext [

	^ FFICalloutAPI calloutAPIClass inContext: aContext
]

{ #category : #signaling }
GtkDrawingArea >> eliotConnectDraw: aBlock [
	| callback |
	
	callback := FFICallback 
		signature: #(int (void *widget, void *cr, void *payload)) 
		block: [ :w :cr :payload | aBlock value: cr ].

	callbacks ifNil: [ callbacks := Set new ].
	callbacks add: callback.
	
	self 
		eliotConnectSignal: 'draw' 
		callback: callback 
		data: ExternalAddress null
		notify: ExternalAddress null
		flags: 0
]

{ #category : #signaling }
GtkDrawingArea >> eliotConnectSignal: signalName callback: aCallback data: aData notify: aNotify flags: flags [

	self eliotCall: #(ulong g_signal_connect_data ( 
			self,
			const char *signalName,
			FFICallback aCallback,
			void *	aData,
			void *aNotify,
			int flags ) )
]

{ #category : #private }
GtkDrawingArea >> extent: aPoint [
	requestedSize := aPoint.
	self setSizeRequestWidth: aPoint x height: aPoint y
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
		ffiCall: #(void gtk_widget_get_size_request #(self , gint width , gint height)).
]

{ #category : #initialization }
GtkDrawingArea >> initialize [

	super initialize.
	self hExpand: true.
	self vExpand: true.
	self appPaintable: true.
	self connectDraw: [ :cr | self draw: cr ]
]

{ #category : #private }
GtkDrawingArea >> setSizeRequestWidth: width height: height [
	
	self
		ffiCall: #(void gtk_widget_set_size_request #(self , gint width , gint height))
]
