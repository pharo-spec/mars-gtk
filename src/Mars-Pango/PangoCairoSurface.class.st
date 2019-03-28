Class {
	#name : #PangoCairoSurface,
	#superclass : #AthensCairoSurface,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#category : #'Mars-Pango-Athens'
}

{ #category : #'instance creation' }
PangoCairoSurface class >> newFromData: pixels width: width height: height [
	| stride |
	stride := self primStrideForWidth: width.
	^ (self
		primImageFromData: pixels
		width: width
		height: height
		stride: stride) 
		initialize
]

{ #category : #'instance creation' }
PangoCairoSurface class >> primImageFromData: data width: width height: height stride: stride [
	^ self ffiCall: #(AthensCairoSurface cairo_image_surface_create_for_data (
		void *data,
		CAIRO_FORMAT_A8,
		int width,
		int height,
		int stride))


]

{ #category : #'instance creation' }
PangoCairoSurface class >> primStrideForWidth: width [
	^ self ffiCall: #(int cairo_format_stride_for_width (CAIRO_FORMAT_A8, int width))
]
