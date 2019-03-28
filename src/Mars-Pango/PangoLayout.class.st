Class {
	#name : #PangoLayout,
	#superclass : #FFIOpaqueObject,
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#category : #'Mars-Pango-Base'
}

{ #category : #finalization }
PangoLayout class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	^ self g_object_unref: handle
]

{ #category : #private }
PangoLayout class >> g_object_unref: handle [
	^ self ffiCall: #( void g_object_unref (void *handle)) module: PangoLibrary
]

{ #category : #'instance creation' }
PangoLayout class >> newCanvas: aCanvas [
	^ self pango_cairo_create_layout: aCanvas
]

{ #category : #'instance creation' }
PangoLayout class >> newContext: aContext [
	^ self pango_layout_new: aContext
]

{ #category : #private }
PangoLayout class >> pango_cairo_create_layout: cr [
	^ self 
		ffiCall: #(PangoLayout *pango_cairo_create_layout (AthensCairoCanvas cr))
		module: PangoCairoLibrary
]

{ #category : #private }
PangoLayout class >> pango_layout_new: context [
	^ self ffiCall: #(PangoLayout *pango_layout_new (PangoContext *context))
]

{ #category : #accessing }
PangoLayout >> fontDescription: desc [
	self ffiCall: #(void pango_layout_set_font_description (self, const PangoFontDescription *desc))
]

{ #category : #initialization }
PangoLayout >> initialize [
	self autoRelease
]

{ #category : #accessing }
PangoLayout >> markup: markup [
	^ self ffiCall: #(void pango_layout_set_markup (self, const char *markup, -1))
]

{ #category : #private }
PangoLayout >> primGetSizeWidth: width height: height [
	self ffiCall: #(void pango_layout_get_size (self, int *width, int *height))

	
]

{ #category : #accessing }
PangoLayout >> size [ 
	| widthBuffer heightBuffer |
	widthBuffer := ByteArray new: FFIInt32 externalTypeSize.
	heightBuffer := ByteArray new: FFIInt32 externalTypeSize.
	self primGetSizeWidth: widthBuffer height: heightBuffer.
	^ (widthBuffer signedLongAt: 1) @ (heightBuffer signedLongAt: 1)
]

{ #category : #accessing }
PangoLayout >> text: text [
	self ffiCall: #(void pango_layout_set_text (self, const char *text, -1))
]

{ #category : #accessing }
PangoLayout >> width: width [
	self ffiCall: #(void pango_layout_set_width (self, int width))
]
