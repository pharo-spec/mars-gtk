"
I'm a widget displaying an image.

https://developer.gnome.org/gtk3/stable/GtkImage.html
"
Class {
	#name : #GtkImage,
	#superclass : #GtkWidget,
	#pools : [
		'AthensCairoDefs',
		'GtkIconSize'
	],
	#category : 'Mars-Gtk-Misc'
}

{ #category : #private }
GtkImage class >> imageNewFromStock: stock_id [
	^ self ffiCall: #(GtkImage *gtk_image_new_from_stock (const gchar *stock_id))
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
GtkImage class >> newMorph: anImageMorph [
	^ self imageNewFromSurface: (self surfaceFor: anImageMorph)
]

{ #category : #'instance creation' }
GtkImage class >> newStock: aString [
	^ self imageNewFromStock: aString
]

{ #category : #private }
GtkImage class >> surfaceFor: anImageMorph [
	| surface |

	surface := AthensCairoSurface extent: anImageMorph extent.
	surface drawDuring: [ :canvas |
		anImageMorph drawOnAthensCanvas: canvas ].
	^ surface
]
