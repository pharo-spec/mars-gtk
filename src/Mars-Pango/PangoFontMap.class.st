"
https://developer.gnome.org/pango/stable/pango-Fonts.html#PangoFontMap
"
Class {
	#name : #PangoFontMap,
	#superclass : #PangoObject,
	#category : #'Mars-Pango-Base'
}

{ #category : #'instance creation' }
PangoFontMap class >> default [ 

	^ self getDefault initialize
]

{ #category : #'library path' }
PangoFontMap class >> ffiLibraryName [ 

	^ PangoCairoLibrary
]

{ #category : #private }
PangoFontMap class >> getDefault [

	^ self ffiCall: #(PangoFontMap *pango_cairo_font_map_get_default ())
]

{ #category : #'as yet unclassified' }
PangoFontMap >> config: fcconfig [

	self ffiCall: #(void pango_fc_font_map_set_config (self, FcConfig *fcconfig))
]
