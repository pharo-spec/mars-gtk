"
I'm a container with just one child.

https://developer.gnome.org/gtk3/stable/GtkBin.html
"
Class {
	#name : #GtkBin,
	#superclass : #GtkContainer,
	#pools : [
		'GtkOrientation'
	],
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #accessing }
GtkBin class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_bin_init(void *object))
]

{ #category : #accessing }
GtkBin class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_bin_get_type())
]

{ #category : #'instance creation' }
GtkBin class >> newWidget: aWidget [
	^ self new 
		add: aWidget;
		yourself
]

{ #category : #accessing }
GtkBin >> add: aWidget [

	self children ifNotEmpty: [ 
		GtkError signal: 'Bin container already contains a widget!' ].

	^ super add: aWidget
]

{ #category : #accessing }
GtkBin >> child [
	^ self children anyOne
]

{ #category : #accessing }
GtkBin >> removeChild [

	self remove: self child
]
