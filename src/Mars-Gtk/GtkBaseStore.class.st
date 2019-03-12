"
A common parent for stores. 
I will keep the commonly used api (iterators, etc.) 
"
Class {
	#name : #GtkBaseStore,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Misc'
}

{ #category : #private }
GtkBaseStore class >> basicNewWithNumberOfColumns: aNumber andTypes: anExternalArray [

	self subclassResponsibility
]

{ #category : #'instance creation' }
GtkBaseStore class >> newColumnTypes: columnTypes [
	| columnTypesExternalArray longSize |
	
	longSize := FFIArchitecture forCurrentArchitecture sizeTTypeSize.
	columnTypesExternalArray := ByteArray new: columnTypes size * longSize.
	
	columnTypes withIndexDo: [ :value :index | 
		columnTypesExternalArray 
			platformSizeTAt: 1 + ((index - 1) * longSize) 
			put: value ].

	columnTypesExternalArray pinInMemory.

	^ [(self 
		basicNewWithNumberOfColumns: columnTypes size 
		andTypes: columnTypesExternalArray) 
		initialize] ensure: [ columnTypesExternalArray unpinInMemory ]
]

{ #category : #'instance creation' }
GtkBaseStore class >> newStrings: aCollection [
	"convenience method to create a store of strings"
	| store |
	
	store := self newColumnTypes: { G_TYPE_STRING }.
	aCollection do: [ :each |
		store appendNew
			at: 0 
			putString: each ].

	^ store
]

{ #category : #private }
GtkBaseStore >> getIter: iter fromPath: path [
	
	self ffiCall: #(gboolean gtk_tree_model_get_iter (
		self,
		GtkTreeIter *iter,
		GtkTreePath *path))
]

{ #category : #private }
GtkBaseStore >> getIter: iter fromString: path_string [
	
	self ffiCall: #(gboolean gtk_tree_model_get_iter_from_string (
		self,
		void *iter,
		const gchar *path_string))
]

{ #category : #accessing }
GtkBaseStore >> iteratorFromPath: aPath [
	| iter |

	iter := GtkTreeIter new 
		store: self;
		yourself.

	(self getIter: iter fromPath: aPath) ifFalse: [
		self error: 'Iterator could not be set' ].	

	^ iter
]

{ #category : #accessing }
GtkBaseStore >> iteratorFromString: aString [
	| iter |

	iter := GtkTreeIter new 
		store: self;
		yourself.
	
	(self getIter: iter fromString: aString) ifFalse: [
		self error: 'Iter could not be set' ].
	
	^ iter
]
