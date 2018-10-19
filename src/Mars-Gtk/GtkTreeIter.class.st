"
* GtkTreeIter:
 * @stamp: a unique stamp to catch invalid iterators
 * @user_data: model-specific data
 * @user_data2: model-specific data
 * @user_data3: model-specific data
 *
 * The #GtkTreeIter is the primary structure
 * for accessing a #GtkTreeModel. Models are expected to put a unique
 * integer in the @stamp member, and put
 * model-specific data in the three @user_data
 * members.
"
Class {
	#name : #GtkTreeIter,
	#superclass : #GtkAbstractIter,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeIter >> atColumnIndex: index setValue: aValue [

	 self ffiCall: #(void gtk_tree_store_set (GtkTreeStore* store, self, uint index, void* aValue, -1))
]

{ #category : #accessing }
GtkTreeIter >> newChild [

	^ store appendChildInParent: self
]

{ #category : #accessing }
GtkTreeIter >> setValues: aValueArray [

	^ self ffiCall: #(void gtk_tree_store_set_valist (GtkTreeStore* #store,
                          self,
                          void *aValueArray))
]
