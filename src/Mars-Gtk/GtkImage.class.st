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
GtkImage class >> imageNewFromIconName: iconNameString size: aSize [
	^ self ffiCall: #(GtkImage *gtk_image_new_from_icon_name (String iconNameString, GtkIconSize aSize))
]

{ #category : #private }
GtkImage class >> imageNewFromSurface: surface [
	^ self ffiCall: #(GtkWidget *gtk_image_new_from_surface (AthensCairoSurface surface))
]

{ #category : #'instance creation' }
GtkImage class >> newForm: aForm [
	^ self newMorph: aForm asMorph
]

{ #category : #'instance creation' }
GtkImage class >> newIconForButtonNamed: aString [
	^ self imageNewFromIconName: aString size: GtkIconSize GTK_ICON_SIZE_BUTTON
]

{ #category : #'instance creation' }
GtkImage class >> newIconForDialogNamed: aString [
	^ self imageNewFromIconName: aString size: GtkIconSize GTK_ICON_SIZE_DIALOG
]

{ #category : #'instance creation' }
GtkImage class >> newIconForDragAndDropNamed: aString [
	^ self imageNewFromIconName: aString size: GtkIconSize GTK_ICON_SIZE_DND
]

{ #category : #'instance creation' }
GtkImage class >> newIconForLargeToolbarNamed: aString [
	^ self imageNewFromIconName: aString size: GtkIconSize GTK_ICON_SIZE_LARGE_TOOLBAR
]

{ #category : #'instance creation' }
GtkImage class >> newIconForMenuNamed: aString [
	^ self imageNewFromIconName: aString size: GtkIconSize GTK_ICON_SIZE_MENU
]

{ #category : #'instance creation' }
GtkImage class >> newIconForSmallToolbarNamed: aString [
	^ self imageNewFromIconName: aString size: GtkIconSize GTK_ICON_SIZE_SMALL_TOOLBAR
]

{ #category : #'instance creation' }
GtkImage class >> newIconNamed: aString withSize: aSize [
	^ self imageNewFromIconName: aString size: aSize
]

{ #category : #'instance creation' }
GtkImage class >> newMorph: anImageMorph [
	^ self imageNewFromSurface: (self surfaceFor: anImageMorph)
]

{ #category : #private }
GtkImage class >> surfaceFor: anImageMorph [
	| surface |

	surface := AthensCairoSurface extent: anImageMorph extent.
	surface drawDuring: [ :canvas |
		anImageMorph drawOnAthensCanvas: canvas ].
	^ surface
]
