"
I'm a font description

https://developer.gnome.org/pango/stable/pango-Fonts.html#PangoFontDescription
"
Class {
	#name : #PangoFontDescription,
	#superclass : #FFIOpaqueObject,
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#category : #'Mars-Pango-Base'
}

{ #category : #finalization }
PangoFontDescription class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	^ self pango_font_description_free: handle
]

{ #category : #'instance creation' }
PangoFontDescription class >> newFromString: aString [
	^ (self pango_font_description_from_string: aString) initialize
]

{ #category : #private }
PangoFontDescription class >> pango_font_description_free: desc [
	self ffiCall: #(void pango_font_description_free (void *desc))
]

{ #category : #private }
PangoFontDescription class >> pango_font_description_from_string: str [
	^ self ffiCall: #(PangoFontDescription *pango_font_description_from_string (const char *str))
]

{ #category : #accessing }
PangoFontDescription >> familyName [
	
	^ self ffiCall: #(String pango_font_description_get_family (self))
]

{ #category : #accessing }
PangoFontDescription >> familyName: family [ 

	^ self ffiCall: #(void pango_font_description_set_family(self, String family))
]

{ #category : #initialization }
PangoFontDescription >> initialize [
	self autoRelease
]
