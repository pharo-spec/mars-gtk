"
GtkStyleProvider — Interface to provide style information to GtkStyleContext

https://developer.gnome.org/gtk3/stable/GtkStyleProvider.html
"
Class {
	#name : #GtkStyleProvider,
	#superclass : #GObject,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #accessing }
GtkStyleProvider class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_style_provider_init(void *object))
]

{ #category : #accessing }
GtkStyleProvider class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_style_provider_get_type())
]
