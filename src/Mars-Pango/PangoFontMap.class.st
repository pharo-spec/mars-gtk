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

{ #category : #'instance creation' }
PangoFontMap class >> newFreeType [

	^ (self newType: "CAIRO_FONT_TYPE_FT" 1) initialize
]

{ #category : #private }
PangoFontMap class >> newType: fonttype [

	^ self ffiCall: #(PangoFontMap *pango_cairo_font_map_new_for_font_type ("cairo_font_type_t"int fonttype))
]

{ #category : #'as yet unclassified' }
PangoFontMap >> config: fcconfig [

	self ffiCall: #(void pango_fc_font_map_set_config (self, FcConfig *fcconfig))
]

{ #category : #'as yet unclassified' }
PangoFontMap >> configChanged [

	self ffiCall: #(void pango_fc_font_map_config_changed (self))
]
