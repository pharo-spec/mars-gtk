Class {
	#name : #GtkQuartzCairoSurface,
	#superclass : #GtkCairoSurface,
	#category : #'Mars-Gtk-Morphic'
}

{ #category : #private }
GtkQuartzCairoSurface class >> primImage: aFormat width: aWidth height: aHeight [
	"rewrite to answer correct receiver"

	^ self ffiCall: #(GtkQuartzCairoSurface cairo_image_surface_create (
		int aFormat,
		int aWidth,
		int aHeight))

]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGColorSpaceCreateDeviceRGB [
	
	^ self 
		ffiCall: #("CGColorSpaceRef"void *CGColorSpaceCreateDeviceRGB(void))
		module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGColorSpaceRelease: space [

	self 
		ffiCall: #(void CGColorSpaceRelease("CGColorSpaceRef"void *space)) 
		module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGContext: aContext clipToRect: rect [

	self 
		ffiCall: #(void CGContextClipToRect("CGContextRef"void *aContext, "CGRect"void *rect))
		module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGContext: aContext rect: rect drawImage: image [

	self 
		ffiCall: #(void CGContextDrawImage(
			"CGContextRef"void *aContext, 
			"CGRect"void *rect, 
			"CGImageRef"void *image))
		module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGContextRestoreGState: aContext [

	self 
		ffiCall: #(void CGContextRestoreGState(void *aContext))
		module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGContextSaveGState: aContext [
	
	self 
		ffiCall: #(void CGContextSaveGState("CGContextRef"void *aContext))
		module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGDataProviderCreateWithData: data size: size [
	
	^ self 
		ffiCall: #(void *CGDataProviderCreateWithData(NULL, const void *data, size_t size, NULL))
		module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGDataProviderRelease: data [

	self 
		ffiCall: #(void CGDataProviderRelease("CGDataProviderRef"void *data)) 
		module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> CGImageRelease: image [

	self 
		ffiCall: #(void CGImageRelease:("CGImageRef"void *image)) 
		module: self moduleCoreGraphics
]

{ #category : #copying }
GtkQuartzCairoSurface >> copyForm: aForm clippedBy: aRect at: aPoint [
	""
	| space dataProvider image cgContext cgRect |

	space := self CGColorSpaceCreateDeviceRGB.
	dataProvider := self CGDataProviderCreateWithData: aForm bits size: aForm bitsSize.
	image := self
		imageCreateWidth: aForm width
		height: aForm height
		bitsPerComponent: 8
		bitsPerPixel: 32
		bytesPerRow: (aForm width * 32 / 8) asInteger
		space: space
		bitmapInfo: 16r4003 "(4 << 12) | 3"	"kCGBitmapByteOrder32Big | kCGImageAlphaLast"
		provider: dataProvider
		decode: ExternalAddress null
		shouldInterpolate: false
		intent: 0.	

	self flush.
	cgContext := self getContext.
	self CGContextSaveGState: cgContext.
	cgRect := self rectangleToCGRect: aRect.
	self CGContext: cgContext clipToRect: cgRect.
	self 
		CGContext: cgContext 
		rect: cgRect 
		drawImage: image.

	self CGImageRelease: image.
	self CGDataProviderRelease: dataProvider.
	self CGColorSpaceRelease: space.
	self CGContextRestoreGState: cgContext.
	
	self markDirty
	"super copyForm: aForm clippedBy: aRect at: aPoint"
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> getContext [
	
	^ self 
		ffiCall: #("CGContext"void *cairo_quartz_surface_get_cg_context (self)) 
		module: CairoLibrary
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> getTargetFrom: cr [
	
	^ self 
		ffiCall: #(void *cairo_get_target (void *cr)) 
		module: CairoLibrary
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> imageCreateWidth: width height: height bitsPerComponent: bitsPerComponent bitsPerPixel: bitsPerPixel bytesPerRow: bytesPerRow space: space bitmapInfo: bitmapInfo provider: provider decode: decode shouldInterpolate: shouldInterpolate intent: intent [

	^ self 
		ffiCall: #("CGImageRef"void *CGImageCreate(
			size_t width, 
			size_t height, 
			size_t bitsPerComponent, 
			size_t bitsPerPixel, 
			size_t bytesPerRow, 
			"CGColorSpaceRef"void *space, 
			"CGBitmapInfo"uint32 bitmapInfo, 
			"CGDataProviderRef"void *provider, 
			"CGFloat *"void *decode, 
			Boolean shouldInterpolate, 
			"CGColorRenderingIntent"uint32 intent))
	module: self moduleCoreGraphics
]

{ #category : #'private primitives' }
GtkQuartzCairoSurface >> moduleCoreGraphics [

	^ '/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics'
]

{ #category : #copying }
GtkQuartzCairoSurface >> rectangleToCGRect: aRect [
	| rect |
	
	rect := FFIExternalArray newType: #double size: 4.
	rect at: 1 put: aRect left.
	rect at: 2 put: aRect top.
	rect at: 3 put: aRect width.
	rect at: 4 put: aRect height.

	^ rect getHandle
]
