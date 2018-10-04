"
GdkRGBA is a convenient way to pass rgba colors around. It’s based on cairo’s way to deal with colors and mirrors its behavior. All values are in the range from 0.0 to 1.0 inclusive. So the color (0.0, 0.0, 0.0, 0.0) represents transparent black and (1.0, 1.0, 1.0, 1.0) is opaque white. Other values will be clamped to this range when drawing.

https://developer.gnome.org/gdk3/stable/gdk3-RGBA-Colors.html
"
Class {
	#name : #GdkRGBA,
	#superclass : #FFIExternalStructure,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : 'Mars-Gtk-Misc'
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
	^handle doubleAt: 25
]

{ #category : #'accessing structure variables' }
GdkRGBA >> alpha: anObject [
	"This method was automatically generated"
	handle doubleAt: 25 put: anObject
]

{ #category : #converting }
GdkRGBA >> asString [ 
	^ self ffiCall: #( gchar *gdk_rgba_to_string ( self ) )
]

{ #category : #'accessing structure variables' }
GdkRGBA >> blue [
	"This method was automatically generated"
	^handle doubleAt: 17
]

{ #category : #'accessing structure variables' }
GdkRGBA >> blue: anObject [
	"This method was automatically generated"
	handle doubleAt: 17 put: anObject
]

{ #category : #'library path' }
GdkRGBA >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'accessing structure variables' }
GdkRGBA >> green [
	"This method was automatically generated"
	^handle doubleAt: 9
]

{ #category : #'accessing structure variables' }
GdkRGBA >> green: anObject [
	"This method was automatically generated"
	handle doubleAt: 9 put: anObject
]

{ #category : #'accessing structure variables' }
GdkRGBA >> red [
	"This method was automatically generated"
	^handle doubleAt: 1
]

{ #category : #'accessing structure variables' }
GdkRGBA >> red: anObject [
	"This method was automatically generated"
	handle doubleAt: 1 put: anObject
]
