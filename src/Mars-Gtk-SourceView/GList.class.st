Class {
	#name : #GList,
	#superclass : #GObject,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #finalization }
GList class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	(self isValidHandle: handle) ifFalse: [ ^ self ].

	GtkFinalizeSignal emitTarget: self handle: handle.
	self gListFree: handle
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

	self setHandle: (self gListAppend: aGObject getHandle)
]

{ #category : #private }
GList >> gListAppend: data [

	^ self ffiCall: #(void *g_list_append (void *handle, gpointer data))
]
