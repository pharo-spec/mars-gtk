"
I store attributed text for display in a GtkTextView.

https://developer.gnome.org/gtk3/stable/GtkTextBuffer.html
"
Class {
	#name : #GtkTextBuffer,
	#superclass : #GObject,
	#pools : [
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #accessing }
GtkTextBuffer >> appendMarkup: aString [

	self 
		insertMarkupIter: self endIter 
		text: aString
]

{ #category : #accessing }
GtkTextBuffer >> appendText: aString [

	self 
		insertIter: self endIter 
		text: aString
]

{ #category : #private }
GtkTextBuffer >> endIter [ 
	| end |

	end := GtkTextIter new.
	self endIter: end.
	^ end
	
]

{ #category : #private }
GtkTextBuffer >> endIter: iter [

	self ffiCall: #(void gtk_text_buffer_get_end_iter (self, GtkTextIter *iter))
]

{ #category : #private }
GtkTextBuffer >> insertIter: iter text: text [

	^ self ffiCall: #(void gtk_text_buffer_insert (self,
                        GtkTextIter *iter,
                        const gchar *text,
                        -1))
]

{ #category : #accessing }
GtkTextBuffer >> insertMarkup: aString [

	self 
		insertMarkupIter: self startIter 
		text: aString
]

{ #category : #private }
GtkTextBuffer >> insertMarkupIter: iter text: text [

	^ self ffiCall: #(void gtk_text_buffer_insert_markup (self,
                        GtkTextIter *iter,
                        const gchar *text,
                        -1))
]

{ #category : #accessing }
GtkTextBuffer >> insertText: aString [

	self 
		insertIter: self startIter 
		text: aString
]

{ #category : #accessing }
GtkTextBuffer >> insertTextAtCursor: text [

	^ self ffiCall: #(void gtk_text_buffer_insert_at_cursor (self, const gchar *text, -1))
]

{ #category : #private }
GtkTextBuffer >> startIter [ 
	| start |

	start := GtkTextIter new.
	self startIter: start.
	^ start
	
	
]

{ #category : #private }
GtkTextBuffer >> startIter: iter [

	self ffiCall: #(void gtk_text_buffer_get_start_iter (self, GtkTextIter *iter))
]

{ #category : #accessing }
GtkTextBuffer >> text [

	^ self 
		textStart: self startIter 
		end: self endIter
		includeHiddenChars: false
]

{ #category : #accessing }
GtkTextBuffer >> text: text [

	self ffiCall: #(void gtk_text_buffer_set_text (self, String text, "gint len" -1))
]

{ #category : #private }
GtkTextBuffer >> textStart: start end: end includeHiddenChars: include_hidden_chars [ 

	self ffiCall: #(String gtk_text_buffer_get_text (
		self,
      const GtkTextIter *start,
      const GtkTextIter *end,
      gboolean include_hidden_chars))
]
