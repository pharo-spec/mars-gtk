Class {
	#name : #GClass,
	#superclass : #Object,
	#instVars : [
		'builder'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #'instance creation' }
GClass class >> newBuilder: aBuilder [

	^ self basicNew 
		initializeBuilder: aBuilder;
		yourself
]

{ #category : #'library path' }
GClass >> ffiLibraryName [
	
	^ GObjectLibrary
]

{ #category : #private }
GClass >> gObjectNew: object_type [

	^ self ffiCall: #(void *g_object_new (gsize object_type, NULL))
]

{ #category : #accessing }
GClass >> gType [

	^ builder typeId
]

{ #category : #initialization }
GClass >> initializeBuilder: aBuilder [

	self initialize.
	builder := aBuilder
]

{ #category : #'instance creation' }
GClass >> new [ 
	| handle |

	handle := self gObjectNew: self gType.
	^ GObject fromHandle: handle
]

{ #category : #accessing }
GClass >> parent [

	^ builder parentClass
]
