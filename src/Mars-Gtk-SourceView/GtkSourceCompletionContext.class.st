"
GtkSourceCompletionContext — The context of a completion

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletionContext.html
"
Class {
	#name : #GtkSourceCompletionContext,
	#superclass : #GObject,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #adding }
GtkSourceCompletionContext >> addProposals: proposals provider: provider finished: finished [

	self ffiCall: #(void gtk_source_completion_context_add_proposals (
		self,
		GtkSourceCompletionProvider *provider,
 		GList *proposals,
 		gboolean finished))
]
