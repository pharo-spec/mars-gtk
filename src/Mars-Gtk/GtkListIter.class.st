Class {
	#name : #GtkListIter,
	#superclass : #GtkAbstractIter,
	#category : #'Mars-Gtk-Widget-List'
}

{ #category : #accessing }
GtkListIter >> atColumnIndex: index setString: aValue [
	"Just a convenience method to avoid adding an extra zero to all Strings"

	 self ffiCall: #(void gtk_list_store_set (GtkListStore *store, self, uint index, String aValue, -1))
]

{ #category : #accessing }
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
