"
Describes the image data representation used by a GtkImage. 

https://developer.gnome.org/gtk3/stable/GtkImage.html#GtkImageType
"
Class {
	#name : #GtkImageType,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_IMAGE_ANIMATION',
		'GTK_IMAGE_EMPTY',
		'GTK_IMAGE_GICON',
		'GTK_IMAGE_ICON_NAME',
		'GTK_IMAGE_ICON_SET',
		'GTK_IMAGE_PIXBUF',
		'GTK_IMAGE_STOCK',
		'GTK_IMAGE_SURFACE'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'accessing enum' }
GtkImageType class >> GTK_IMAGE_ANIMATION [
	"This method was automatically generated"
	^ GTK_IMAGE_ANIMATION
]

{ #category : #'accessing enum' }
GtkImageType class >> GTK_IMAGE_EMPTY [
	"This method was automatically generated"
	^ GTK_IMAGE_EMPTY
]

{ #category : #'accessing enum' }
GtkImageType class >> GTK_IMAGE_GICON [
	"This method was automatically generated"
	^ GTK_IMAGE_GICON
]

{ #category : #'accessing enum' }
GtkImageType class >> GTK_IMAGE_ICON_NAME [
	"This method was automatically generated"
	^ GTK_IMAGE_ICON_NAME
]

{ #category : #'accessing enum' }
GtkImageType class >> GTK_IMAGE_ICON_SET [
	"This method was automatically generated"
	^ GTK_IMAGE_ICON_SET
]

{ #category : #'accessing enum' }
GtkImageType class >> GTK_IMAGE_PIXBUF [
	"This method was automatically generated"
	^ GTK_IMAGE_PIXBUF
]

{ #category : #'accessing enum' }
GtkImageType class >> GTK_IMAGE_STOCK [
	"This method was automatically generated"
	^ GTK_IMAGE_STOCK
]

{ #category : #'accessing enum' }
GtkImageType class >> GTK_IMAGE_SURFACE [
	"This method was automatically generated"
	^ GTK_IMAGE_SURFACE
]

{ #category : #'enum declaration' }
GtkImageType class >> enumDecl [
	"self initializeEnumeration.
	 self rebuildEnumAccessors"
	
	^ #(  	
	GTK_IMAGE_EMPTY			0
	GTK_IMAGE_PIXBUF 		1
	GTK_IMAGE_STOCK 		2
	GTK_IMAGE_ICON_SET 	3
	GTK_IMAGE_ANIMATION 	4
	GTK_IMAGE_ICON_NAME 	5 
	GTK_IMAGE_GICON 		6 
	GTK_IMAGE_SURFACE 		7
	)
]
