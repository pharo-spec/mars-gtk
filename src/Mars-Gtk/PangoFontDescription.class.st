Class {
	#name : #PangoFontDescription,
	#superclass : #GBaseObject,
	#category : #'Mars-Gtk-Styles'
}

{ #category : #accessing }
PangoFontDescription >> familyName [
	
	^ self ffiCall: #(String pango_font_description_get_family (self))
]

{ #category : #accessing }
PangoFontDescription >> familyName: family [ 

	^ self ffiCall: #(void pango_font_description_set_family(self, String family))
]
