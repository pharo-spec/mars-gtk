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
	#superclass : #FFIExternalStructure,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'listStore'
	],
	#classVars : [
		'OFFSET_STAMP',
		'OFFSET_USER_DATA',
		'OFFSET_USER_DATA2',
		'OFFSET_USER_DATA3'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Widget-List'
}

{ #category : #'field definition' }
GtkTreeIter class >> fieldsDesc [
	"self compileFields"
	^ #(
		gint stamp;
		gpointer user_data;
		gpointer user_data2;
		gpointer user_data3;)
]

{ #category : #accessing }
GtkTreeIter >> atColumnIndex: index setValue: aValue [

	 self ffiCall: #(void gtk_list_store_set (GtkListStore* listStore, self, uint index, void* aValue, -1))
]

{ #category : #accessing }
GtkTreeIter >> listStore [
	^ listStore
]

{ #category : #accessing }
GtkTreeIter >> listStore: anObject [
	listStore := anObject
]

{ #category : #accessing }
GtkTreeIter >> setValues: aValueArray [

	^ self ffiCall: #(void gtk_list_store_set_valist (GtkListStore* listStore,
                          self,
                          void *aValueArray))
]
