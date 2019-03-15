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
