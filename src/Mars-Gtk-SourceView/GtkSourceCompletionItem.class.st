"
GtkSourceCompletionItem — Simple implementation of GtkSourceCompletionProposal

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletionItem.html
"
Class {
	#name : #GtkSourceCompletionItem,
	#superclass : #GObject,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #private }
GtkSourceCompletionItem class >> completionItemNew [

	^ self ffiCall: #(GtkSourceCompletionItem *gtk_source_completion_item_new (void))
]

{ #category : #'library path' }
GtkSourceCompletionItem class >> ffiLibraryName [

	^ GtkSourceViewLibrary
]

{ #category : #'instance creation' }
GtkSourceCompletionItem class >> new [

	^ self completionItemNew initialize
]

{ #category : #'instance creation' }
GtkSourceCompletionItem class >> newLabel: aString [ 
	
	^ self new 
		label: aString;
		yourself
]

{ #category : #'library path' }
GtkSourceCompletionItem >> ffiLibraryName [

	^ GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceCompletionItem >> icon: icon [ 

	^ self ffiCall: #(void gtk_source_completion_item_set_icon (self, GdkPixbuf *icon))
]

{ #category : #initialization }
GtkSourceCompletionItem >> initialize [

	super initialize.
	self autoRelease
]

{ #category : #accessing }
GtkSourceCompletionItem >> label [ 

	^ self gObjectGetString: 'label'
]

{ #category : #accessing }
GtkSourceCompletionItem >> label: label [

	^ self ffiCall: #(void gtk_source_completion_item_set_label (self, const gchar *label))
]

{ #category : #accessing }
GtkSourceCompletionItem >> markup [

	^ self gObjectGetString: 'markup'
]

{ #category : #accessing }
GtkSourceCompletionItem >> markup: markup [

	^ self ffiCall: #(void gtk_source_completion_item_set_markup (self, const gchar *markup))
]

{ #category : #initialization }
GtkSourceCompletionItem >> referenceAfterCreation [
	"do not reference, we already have one because we do #new"
]

{ #category : #accessing }
GtkSourceCompletionItem >> text [

	^ self gObjectGetString: 'text'
]

{ #category : #accessing }
GtkSourceCompletionItem >> text: text [ 

	self ffiCall: #(void gtk_source_completion_item_set_text (self, const gchar *text))
]
