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

	^ self getDefault initialize
]

{ #category : #'library path' }
GtkSourceLanguageManager class >> ffiLibraryName [

	^ GtkSourceViewLibrary 
]

{ #category : #private }
GtkSourceLanguageManager class >> getDefault [ 

	^ self ffiCall: #(GtkSourceLanguageManager *gtk_source_language_manager_get_default(void))
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

	ids := self getLanguageIds.
]
