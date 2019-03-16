"
I'm a base object for the Gtk3 hierarchy. 
Since not all Gtk3 references are actually ""Gtk3 objects"", not all can be descendents of GObject (my main child), but they need to extend me directly.
"
Class {
	#name : #GBaseObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#pools : [
		'GType',
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Base'
}

{ #category : #'library path' }
GBaseObject class >> ffiLibraryName [
	^ GtkLibrary
]

{ #category : #private }
GBaseObject class >> isValidHandle: handle [

	^ handle notNil and: [ handle isNull not ]
]

{ #category : #accessing }
GBaseObject >> application [

	^ GtkApplication current
]

{ #category : #'external resource management' }
GBaseObject >> autoRelease [

	self application resourceManager addResource: self
]

{ #category : #initialization }
GBaseObject >> initialize [
	"cancel chain because superclass attempts to setHandle: 
	 (which is incorrect, probably I should patch UFFI)"

]

{ #category : #testing }
GBaseObject >> isValidHandle [ 

	^ self class isValidHandle: self getHandle
]
