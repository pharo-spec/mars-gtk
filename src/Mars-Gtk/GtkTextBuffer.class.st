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

	self ffiCall: #(void gtk_text_buffer_get_end_iter (self, GtkTextIter *iter))
]

{ #category : #private }
GtkTextBuffer >> startIter: iter [

	self ffiCall: #(void gtk_text_buffer_get_start_iter (self, GtkTextIter *iter))
]

{ #category : #accessing }
GtkTextBuffer >> text [
	| start end |

	start := GtkTextIter new.
	end := GtkTextIter new.
	self startIter: start.
	self endIter: end.
	
	^ self textStart: start end: end includeHiddenChars: false
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
