Class {
	#name : #GClass,
	#superclass : #Object,
	#instVars : [
		'gType',
		'parentClass'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-TypeBuilder'
}

{ #category : #'instance creation' }
GClass class >> newGType: aType parent: aGtkClass [

	^ self basicNew 
		initializeGType: aType parent: aGtkClass;
		yourself
]

{ #category : #'library path' }
GClass >> ffiLibraryName [
	
	^ GObjectLibrary
]

{ #category : #'instance creation' }
GClass >> gObjectNew: object_type [

	^ self ffiCall: #(void *g_object_new (gsize object_type, NULL))
]

{ #category : #accessing }
GClass >> gType [
	^ gType
]

{ #category : #initialization }
GClass >> initializeGType: aType parent: aGtkClass [

	self initialize.
	gType := aType.
	parentClass := aGtkClass
]

{ #category : #'instance creation' }
GClass >> new [ 
	| handle |

	handle := self gObjectNew: self gType.
	^ GObject fromHandle: handle
]

{ #category : #accessing }
GClass >> parent [

	^ parentClass
]
