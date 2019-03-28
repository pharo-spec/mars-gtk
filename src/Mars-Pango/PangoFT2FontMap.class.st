Class {
	#name : #PangoFT2FontMap,
	#superclass : #FFIOpaqueObject,
	#traits : 'TPangoFT2Library',
	#classTraits : 'TPangoFT2Library classTrait',
	#category : #'Mars-Pango-Base'
}

{ #category : #finalization }
PangoFT2FontMap class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	^ self g_object_unref: handle
]

{ #category : #finalization }
PangoFT2FontMap class >> g_object_unref: handle [
	^ self ffiCall: #( void g_object_unref (void *handle)) module: PangoLibrary
]

{ #category : #'instance creation' }
PangoFT2FontMap class >> new [
	^ self pango_ft2_font_map_new initialize
]

{ #category : #private }
PangoFT2FontMap class >> pango_ft2_font_map_new [
	^ self ffiCall: #(PangoFT2FontMap *pango_ft2_font_map_new ())
]

{ #category : #misc }
PangoFT2FontMap >> createContext [
	^ self ffiCall: #(PangoContext *pango_ft2_font_map_create_context (self))
]

{ #category : #initialization }
PangoFT2FontMap >> initialize [
	self autoRelease
]

{ #category : #accessing }
PangoFT2FontMap >> loadFontContext: context description: desc [
	^ self 
		ffiCall: #(PangoFont *pango_font_map_load_font (
			self,
			PangoContext *context,
			const PangoFontDescription *desc))
		module: PangoLibrary
]
