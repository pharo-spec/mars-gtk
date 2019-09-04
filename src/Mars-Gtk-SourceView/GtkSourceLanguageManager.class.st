"
GtkSourceLanguageManager — Provides access to GtkSourceLanguages

https://developer.gnome.org/gtksourceview/unstable/GtkSourceLanguageManager.html#gtk-source-language-manager-get-language-ids
"
Class {
	#name : #GtkSourceLanguageManager,
	#superclass : #GObject,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #'instance creation' }
GtkSourceLanguageManager class >> default [

	^ self getDefault
]

{ #category : #'library path' }
GtkSourceLanguageManager class >> ffiLibraryName [

	^ GtkSourceViewLibrary 
]

{ #category : #accessing }
GtkSourceLanguageManager class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_source_language_manager_get_type())
]

{ #category : #private }
GtkSourceLanguageManager class >> getDefault [ 

	^ self ffiCall: #(GtkSourceLanguageManager *gtk_source_language_manager_get_default())
]

{ #category : #'library path' }
GtkSourceLanguageManager >> ffiLibraryName [

	^ GtkSourceViewLibrary 
]

{ #category : #private }
GtkSourceLanguageManager >> getLanguageIds [

	^ self ffiCall: #("gchar **"void *gtk_source_language_manager_get_language_ids(self))
]

{ #category : #accessing }
GtkSourceLanguageManager >> languageIds [ 
	| ids |

	ids := self getLanguageIds asExternalAddress.
	(ids isNil or: [ ids isNull ]) ifTrue: [ ^ #() ].

	^ (ids 
		readArrayOf: (GObject resolveType: #gpointer) 
		until: [ :each | each isNull ])
		collect: [ :each | each readStringUTF8 ]

]

{ #category : #accessing }
GtkSourceLanguageManager >> languageWithId: id [ 

	^ self ffiCall: #(GtkSourceLanguage *gtk_source_language_manager_get_language(
		self,
		const gchar *id))
]
