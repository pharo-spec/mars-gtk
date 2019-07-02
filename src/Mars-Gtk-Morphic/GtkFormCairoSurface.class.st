"
I'm a cairo surface to be used on form rendering. 
It will create a cairo surface that does not needs to be mapped to RGBA (as my parent does).
"
Class {
	#name : #GtkFormCairoSurface,
	#superclass : #AthensCairoSurface,
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #'instance creation' }
GtkFormCairoSurface class >> extent: anExtent [

	^ self platformClass
		extent: anExtent 
		format: CAIRO_FORMAT_RGB24
]

{ #category : #'instance creation' }
GtkFormCairoSurface class >> extent: anExtent format: aFormat [
	^ ( self primImage: aFormat width: anExtent x height: anExtent y) initialize

]

{ #category : #'instance creation' }
GtkFormCairoSurface class >> fromForm: aForm [
	| form surface |
	
	form := aForm unhibernate; asFormOfDepth: 32.
	surface := self extent: aForm extent.
	
	LibC 
		memCopy: form bits
		to: surface getDataPtr getHandle 
		size: (form width * form height * 4).
	
	surface markDirty.

	^ surface.

]

{ #category : #'instance creation' }
GtkFormCairoSurface class >> platformClass [
		
	OSPlatform current isMacOS ifTrue: [ ^ GtkFormQuartzCairoSurface ].
	^ self
]

{ #category : #private }
GtkFormCairoSurface class >> primImage: aFormat width: aWidth height: aHeight [

	^ self ffiCall: #(GtkFormCairoSurface cairo_image_surface_create (
		int aFormat,
		int aWidth,
		int aHeight))

]
