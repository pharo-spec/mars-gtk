"
Doubly-Linked Lists
Doubly-Linked Lists — linked lists that can be iterated over in both directions

https://developer.gnome.org/glib/stable/glib-Doubly-Linked-Lists.html

This object hides a structure: 

struct _GList
{
  gpointer data;
  GList *next;
  GList *prev;
};

"
Class {
	#name : #GList,
	#superclass : #GtkStructure,
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_NEXT',
		'OFFSET_PREV'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'field definition' }
GList class >> fieldsDesc [ 

	^ #(
  gpointer data;
  GList *next;
  GList *prev
	)
]

{ #category : #finalization }
GList class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	handle isNull ifTrue: [ ^ self ].
	self gListFree: handle.
	handle beNull
]

{ #category : #private }
GList class >> gListFree: list [

	^ self ffiCall: #(void g_list_free (void *list))
]

{ #category : #'instance creation' }
GList class >> new [

	^ self basicNew setHandle: ExternalAddress null
]

{ #category : #accessing }
GList >> append: aGObject [

	^ GList fromHandle: (self gListAppend: aGObject getHandle)
]

{ #category : #'accessing structure variables' }
GList >> data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GList >> data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA put: anObject getHandle.
]

{ #category : #resources }
GList >> ffiLibrary [ 
    ^ GLibLibrary 

]

{ #category : #accessing }
GList >> first [

	^ GList fromHandle: self gListFirst
]

{ #category : #'as yet unclassified' }
GList >> free [

	self ffiCall: #(void g_list_free(self))
]

{ #category : #'as yet unclassified' }
GList >> freeFull: aNotifyCallback [

	self ffiCall: #(void g_list_free_full(self, GCallback aNotifyCallback))
]

{ #category : #private }
GList >> gListAppend: data [

	^ self ffiCall: #(void *g_list_append (self, gpointer data))
]

{ #category : #private }
GList >> gListFirst [

	^ self ffiCall: #(void *g_list_append (self))
]

{ #category : #'accessing structure variables' }
GList >> next [
	"This method was automatically generated"
	^GList fromHandle: (handle pointerAt: OFFSET_NEXT)
]

{ #category : #'accessing structure variables' }
GList >> next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GList >> prev [
	"This method was automatically generated"
	^GList fromHandle: (handle pointerAt: OFFSET_PREV)
]

{ #category : #'accessing structure variables' }
GList >> prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PREV put: anObject getHandle.
]
