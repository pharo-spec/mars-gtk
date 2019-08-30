"
A GtkSourceBuffer object is the model for GtkSourceView widgets. It extends the GtkTextBuffer class by adding features useful to display and edit source code such as syntax highlighting and bracket matching. It also implements support for the undo/redo.

https://developer.gnome.org/gtksourceview/stable/GtkSourceBuffer.html
"
Class {
	#name : #GtkSourceBuffer,
	#superclass : #GtkTextBuffer,
	#category : #'Mars-Gtk-SourceView'
}

{ #category : #accessing }
GtkSourceBuffer class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_source_buffer_init(void *object))
]

{ #category : #accessing }
GtkSourceBuffer class >> gType [ 

	^ self 
		ffiCall: #(gsize gtk_source_buffer_get_type())
		module: GtkSourceViewLibrary
]

{ #category : #'instance creation' }
GtkSourceBuffer class >> newTable: table [

	^ (self sourceBufferNew: table) initialize
]

{ #category : #private }
GtkSourceBuffer class >> sourceBufferNew: table [

	^ self 
		ffiCall: #(GtkSourceBuffer *gtk_source_buffer_new (GtkTextTagTable *table))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceBuffer >> canRedo [

	^ self 
		ffiCall: #(gboolean gtkgtk_source_buffer_can_redo(self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceBuffer >> canUndo [

	^ self 
		ffiCall: #(gboolean gtkgtk_source_buffer_can_undo(self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceBuffer >> highlightMatchingBrackets: highlight [

	^ self 
		ffiCall: #(void gtk_source_buffer_set_highlight_matching_brackets (self, gboolean highlight))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceBuffer >> implicitTrailingNewline: implicit_trailing_newline [

	self 
		ffiCall: #(void gtk_source_buffer_set_implicit_trailing_newline(
			self,
			gboolean implicit_trailing_newline))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceBuffer >> infiniteUndoLevels [

	self maxUndoLevels: -1
		
]

{ #category : #testing }
GtkSourceBuffer >> isHighlightMatchingBrackets [

	^ self 
		ffiCall: #(gboolean gtk_source_buffer_get_highlight_matching_brackets(self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceBuffer >> isImplicitTrailingNewline [

	^ self 
		ffiCall: #(gboolean gtk_source_buffer_get_implicit_trailing_newline (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceBuffer >> maxUndoLevels: max_undo_levels [

	^ self 
		ffiCall: #(void gtk_source_buffer_set_max_undo_levels (
			self,
   			gint max_undo_levels))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceBuffer >> redo [

	^ self 
		ffiCall: #(void gtk_source_buffer_redo (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceBuffer >> undo [

	^ self 
		ffiCall: #(void gtk_source_buffer_undo (self))
		module: GtkSourceViewLibrary
]
