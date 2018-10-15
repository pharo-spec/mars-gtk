"
GtkTextView — Widget that displays a GtkTextBuffer

https://developer.gnome.org/gtk3/stable/GtkTextView.html
"
Class {
	#name : #GtkTextView,
	#superclass : #GtkWidget,
	#category : 'Mars-Gtk-Widget'
}

{ #category : #'instance creation' }
GtkTextView class >> new [
	^ self textViewNew initialize
]

{ #category : #private }
GtkTextView class >> textViewNew [
	^ self ffiCall: #(GtkTextView *gtk_text_view_new (void))
]

{ #category : #accessing }
GtkTextView >> editable: setting [
	self ffiCall: #(void gtk_text_view_set_editable (self, gboolean setting))
]

{ #category : #testing }
GtkTextView >> isEditable [
	"Returns the default editability of the GtkTextView. 
	 Tags in the buffer may override this setting for some ranges of text."
	self ffiCall: #(gboolean gtk_text_view_get_editable (self))
]

{ #category : #accessing }
GtkTextView >> monospace [
	
	^ self ffiCall: #(gboolean gtk_text_view_get_monospace (self))
]

{ #category : #accessing }
GtkTextView >> monospace: aBoolean [

	^ self ffiCall: #(void gtk_text_view_set_monospace (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkTextView >> text [
	^ self textBuffer text
]

{ #category : #accessing }
GtkTextView >> text: aString [
	self textBuffer text: aString
]

{ #category : #accessing }
GtkTextView >> textBuffer [
	self ffiCall: #(GtkTextBuffer *gtk_text_view_get_buffer (self))
]
