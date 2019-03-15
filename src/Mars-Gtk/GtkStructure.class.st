Class {
	#name : #GtkStructure,
	#superclass : #FFIExternalStructure,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #copying }
GtkStructure >> copyIntoImage [
	| size bytes |

	size := self class structureSize.
	bytes := ByteArray new: size.
	LibC memCopy: self getHandle to: bytes size: size.
	^ self copy setHandle: bytes
]
