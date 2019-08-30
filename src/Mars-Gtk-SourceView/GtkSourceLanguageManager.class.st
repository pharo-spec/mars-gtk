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
	| ids idsHandle lastId |

	idsHandle := self getLanguageIds asExternalAddress.
	(idsHandle isNil or: [ idsHandle isNull ]) ifTrue: [ ^ #() ].

	ids := Array new writeStream.
	[ 
		lastId := idsHandle pointerAt: 1.
		lastId isNull ifFalse: [ 
			ids nextPut: lastId readStringUTF8.
			idsHandle := idsHandle + FFIExternalType pointerSize ] ]
	doWhileFalse: [ 
		lastId isNull ].

	^ ids contents
]

{ #category : #accessing }
GtkSourceLanguageManager >> languageWithId: id [ 

	^ self ffiCall: #(GtkSourceLanguage *gtk_source_language_manager_get_language(
		self,
		const gchar *id))
]
