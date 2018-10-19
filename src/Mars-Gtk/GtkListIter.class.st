Class {
	#name : #GtkListIter,
	#superclass : #GtkAbstractIter,
	#category : #'Mars-Gtk-Widget-List'
}

{ #category : #accessing }
GtkListIter >> atColumnIndex: index setValue: aValue [

	 self ffiCall: #(void gtk_list_store_set (GtkListStore* listStore, self, uint index, void* aValue, -1))
]

{ #category : #accessing }
GtkListIter >> setValues: aValueArray [

	^ self ffiCall: #(void gtk_list_store_set_valist (GtkListStore* #store,
                          self,
                          void *aValueArray))
]
