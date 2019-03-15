Class {
	#name : #GtkListIter,
	#superclass : #GtkAbstractIter,
	#category : #'Mars-Gtk-Widget-List'
}

{ #category : #accessing }
GtkListIter >> appendNew [

	self ffiCall: #(void gtk_list_store_append (GtkListStore *store, self))
]

{ #category : #private }
GtkListIter >> atColumnIndex: index setString: aValue [
	"Just a convenience method to avoid adding an extra zero to all Strings"

	 self ffiCall: #(void gtk_list_store_set (GtkListStore *store, self, uint index, String aValue, -1))
]

{ #category : #private }
GtkListIter >> atColumnIndex: index setValue: aValue [

	 self ffiCall: #(void gtk_list_store_set (GtkListStore *store, self, uint index, void *aValue, -1))
]

{ #category : #accessing }
GtkListIter >> setValues: aValueArray [

	^ self ffiCall: #(void gtk_list_store_set_valist (
		GtkListStore *store,
		self,
		void *aValueArray))
]

{ #category : #'accessing structure variables' }
GtkListIter >> stamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_STAMP
]

{ #category : #'accessing structure variables' }
GtkListIter >> stamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_STAMP put: anObject
]

{ #category : #'accessing structure variables' }
GtkListIter >> user_data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkListIter >> user_data2 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA2) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkListIter >> user_data2: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA2 put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtkListIter >> user_data3 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA3) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkListIter >> user_data3: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA3 put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtkListIter >> user_data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA put: anObject getHandle.
]
