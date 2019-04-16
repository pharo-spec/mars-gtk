"
GdkRGBA is a convenient way to pass rgba colors around. It’s based on cairo’s way to deal with colors and mirrors its behavior. All values are in the range from 0.0 to 1.0 inclusive. So the color (0.0, 0.0, 0.0, 0.0) represents transparent black and (1.0, 1.0, 1.0, 1.0) is opaque white. Other values will be clamped to this range when drawing.

https://developer.gnome.org/gdk3/stable/gdk3-RGBA-Colors.html
"
Class {
	#name : #GdkRGBA,
	#superclass : #GtkStructure,
	#classTraits : 'TGtkLibrary classTrait',
	#classVars : [
		'OFFSET_ALPHA',
		'OFFSET_BLUE',
		'OFFSET_GREEN',
		'OFFSET_RED'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'library path' }
GdkRGBA class >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #'as yet unclassified' }
GdkRGBA class >> fieldsDesc [
	"self rebuildFieldAccessors"
	^ #(
	gdouble red;
  	gdouble green;
  	gdouble blue;
  	gdouble alpha;
	)
]

{ #category : #'accessing structure variables' }
GdkRGBA >> alpha [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_ALPHA
]

{ #category : #'accessing structure variables' }
GdkRGBA >> alpha: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_ALPHA put: anObject
]

{ #category : #converting }
GdkRGBA >> asColor [

	^ Color 
		r: self red 
		g: self green 
		b: self blue 
		alpha: self alpha
]

{ #category : #converting }
GdkRGBA >> asString [ 
	^ self ffiCall: #( gchar *gdk_rgba_to_string ( self ) )
]

{ #category : #'accessing structure variables' }
GdkRGBA >> blue [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_BLUE
]

{ #category : #'accessing structure variables' }
GdkRGBA >> blue: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_BLUE put: anObject
]

{ #category : #'library path' }
GdkRGBA >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'accessing structure variables' }
GdkRGBA >> green [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_GREEN
]

{ #category : #'accessing structure variables' }
GdkRGBA >> green: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_GREEN put: anObject
]

{ #category : #'accessing structure variables' }
GdkRGBA >> red [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_RED
]

{ #category : #'accessing structure variables' }
GdkRGBA >> red: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_RED put: anObject
]
