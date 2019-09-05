"
GtkSourceCompletionContext — The context of a completion

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletionContext.html
"
Class {
	#name : #GtkSourceCompletionContext,
	#superclass : #GObject,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #accessing }
GtkSourceCompletionContext >> addProposals: proposals provider: provider finished: finished [

	self ffiCall: #(void gtk_source_completion_context_add_proposals (
		self,
		"GtkSourceCompletionProvider *"GObject *provider,
 		GList *proposals,
 		gboolean finished))
]

{ #category : #'library path' }
GtkSourceCompletionContext >> ffiLibraryName [

	^ GtkSourceViewLibrary
]

{ #category : #private }
GtkSourceCompletionContext >> getIter: iter [
	
	^ self ffiCall: #(gboolean gtk_source_completion_context_get_iter(
		self,
 		GtkTextIter *iter))
]

{ #category : #accessing }
GtkSourceCompletionContext >> iter [
	| iter |
	
	iter := GtkTextIter new.
	^ (self getIter: iter) 
		ifTrue: [ iter ]
		ifFalse: [ nil ]
]
