"
I'm a widget displaying an image.

https://developer.gnome.org/gtk3/stable/GtkImage.html
"
Class {
	#name : #GtkImage,
	#superclass : #GtkWidget,
	#pools : [
		'AthensCairoDefinitions',
		'GtkIconSize'
	],
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #private }
GtkImage class >> basicNewEmpty [

	^ self ffiCall: #(GtkImage * gtk_image_new ())
]

{ #category : #accessing }
GtkImage class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_image_get_type())
]

{ #category : #private }
GtkImage class >> imageNewFromIconName: iconNameString size: aSize [

	^ self ffiCall: #(GtkImage *gtk_image_new_from_icon_name (String iconNameString, GtkIconSize aSize))
]

{ #category : #private }
GtkImage class >> imageNewFromSurface: surface [

	^ self ffiCall: #(GtkImage *gtk_image_new_from_surface (AthensCairoSurface surface))
]

{ #category : #private }
GtkImage class >> new [
	^ self newEmpty
]

{ #category : #private }
GtkImage class >> newEmpty [

	^ self basicNewEmpty initialize
]

{ #category : #'instance creation' }
GtkImage class >> newForm: aForm [

	^ self newMorph: aForm asMorph
]

{ #category : #'instance creation' }
GtkImage class >> newIconForButtonNamed: aString [

	^ self 
		newIconNamed: aString 
		size: GTK_ICON_SIZE_BUTTON
]

{ #category : #'instance creation' }
GtkImage class >> newIconForDialogNamed: aString [

	^ self 
		newIconNamed: aString 
		size: GTK_ICON_SIZE_DIALOG
]

{ #category : #'instance creation' }
GtkImage class >> newIconForDragAndDropNamed: aString [

	^ self 
		newIconNamed: aString 
		size: GTK_ICON_SIZE_DND
]

{ #category : #'instance creation' }
GtkImage class >> newIconForLargeToolbarNamed: aString [

	^ self 
		newIconNamed: aString 
		size: GTK_ICON_SIZE_LARGE_TOOLBAR
]

{ #category : #'instance creation' }
GtkImage class >> newIconForMenuNamed: aString [

	^ self 
		newIconNamed: aString 
		size: GTK_ICON_SIZE_MENU
]

{ #category : #'instance creation' }
GtkImage class >> newIconForSmallToolbarNamed: aString [

	^ self 
		newIconNamed: aString 
		size: GTK_ICON_SIZE_SMALL_TOOLBAR
]

{ #category : #private }
GtkImage class >> newIconNamed: aString size: aSize [

	^ (self 
		imageNewFromIconName: aString 
		size: aSize)
		initialize
]

{ #category : #'instance creation' }
GtkImage class >> newMorph: anImageMorph [

	| surf |
	surf := self surfaceFor: anImageMorph.
	^ (self imageNewFromSurface: surf) initialize
]

{ #category : #private }
GtkImage class >> surfaceFor: anImageMorph [
	| surface |

	surface := AthensCairoSurface extent: anImageMorph extent.
	surface drawDuring: [ :canvas |
		anImageMorph drawOnAthensCanvas: canvas ].

	^ surface
]

{ #category : #converting }
GtkImage >> asGdkPixbuf [
	"this will only work if the image it self is creared from a pixbuf. 
	 Most of the time you are better going through GdkPixbuf creation methods."

	^ self ffiCall: #(GdkPixbuf* gtk_image_get_pixbuf (self))
]

{ #category : #accessing }
GtkImage >> clear [
	
	^ self ffiCall: #(void gtk_image_clear(self))
]

{ #category : #converting }
GtkImage >> setFromGdkPixbuf: pixbuf [

	^ self ffiCall: #(void gtk_image_set_from_pixbuf(self, GdkPixbuf* pixbuf))
]
