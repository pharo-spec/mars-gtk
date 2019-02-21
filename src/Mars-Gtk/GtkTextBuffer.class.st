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

{ #category : #private }
GtkTextBuffer >> endIter: iter [

	self ffiCall: #(void gtk_text_buffer_get_end_iter (self, "GtkTextIter *"void *iter))
]

{ #category : #private }
GtkTextBuffer >> startIter: iter [

	self ffiCall: #(void gtk_text_buffer_get_start_iter (self, "GtkTextIter *"void *iter))
]

{ #category : #accessing }
GtkTextBuffer >> text [
	| start end |

	self startIter: (start := ExternalAddress newPointer) autoRelease.
	self endIter: (end := ExternalAddress newPointer) autoRelease.
	^ self 
		textStart: start 
		end: end 
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
      "const GtkTextIter *" void *start,
      "const GtkTextIter *" void *end,
      gboolean include_hidden_chars))
]
