"
GtkTextView — Widget that displays a GtkTextBuffer

https://developer.gnome.org/gtk3/stable/GtkTextView.html
"
Class {
	#name : #GtkTextView,
	#superclass : #GtkWidget,
	#instVars : [
		'textBuffer'
	],
	#pools : [
		'GtkWrapMode'
	],
	#category : #'Mars-Gtk-Widget'
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
GtkTextView >> beWrapChar [

	self setWrapMode: GTK_WRAP_CHAR
]

{ #category : #accessing }
GtkTextView >> beWrapNone [

	self setWrapMode: GTK_WRAP_NONE
]

{ #category : #accessing }
GtkTextView >> beWrapWord [

	self setWrapMode: GTK_WRAP_WORD
]

{ #category : #accessing }
GtkTextView >> beWrapWordChar [

	self setWrapMode: GTK_WRAP_WORD_CHAR
]

{ #category : #signaling }
GtkTextView >> connectPopulatePopup: aBlock [

	^ (GPopulatePopupCallback do: aBlock) connectTo: self
]

{ #category : #accessing }
GtkTextView >> cursorVisible: setting [

	self ffiCall: #(void gtk_text_view_set_cursor_visible (self, gboolean setting))
]

{ #category : #accessing }
GtkTextView >> editable: setting [
	self ffiCall: #(void gtk_text_view_set_editable (self, gboolean setting))
]

{ #category : #private }
GtkTextView >> getBuffer [

	self ffiCall: #(GtkTextBuffer *gtk_text_view_get_buffer (self))
]

{ #category : #accessing }
GtkTextView >> hAdjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_scrollable_get_hadjustment (self))
]

{ #category : #accessing }
GtkTextView >> hAdjustment: adjustment [

	^ self ffiCall: #(void gtk_scrollable_set_hadjustment (self, GtkAdjustment *adjustment))
]

{ #category : #testing }
GtkTextView >> isCursorVisible [

	^ self ffiCall: #(gboolean gtk_text_view_get_cursor_visible (self))
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

{ #category : #private }
GtkTextView >> scrollToIter: iter withinMargin: within_margin useAlign: use_align xalign: xalign yalign: yalign [

	^ self ffiCall: #(gboolean gtk_text_view_scroll_to_iter (
		self,
      GtkTextIter *iter,
      gdouble within_margin,
      gboolean use_align,
      gdouble xalign,
      gdouble yalign))
]

{ #category : #private }
GtkTextView >> scrollToMark: mark withinMargin: within_margin useAlign: use_align xalign: xalign yalign: yalign [

	^ self ffiCall: #(gboolean gtk_text_view_scroll_to_mark (
		self,
      GtkTextMark *mark,
      gdouble within_margin,
      gboolean use_align,
      gdouble xalign,
      gdouble yalign))
]

{ #category : #private }
GtkTextView >> setBuffer: buffer [

	self ffiCall: #(void gtk_text_view_set_buffer (self, GtkTextBuffer *buffer))
]

{ #category : #private }
GtkTextView >> setWrapMode: wrap_mode [

	^ self ffiCall: #(void gtk_text_view_set_wrap_mode (self, GtkWrapMode wrap_mode))
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

	^ textBuffer ifNil: [ textBuffer := self getBuffer ]
]

{ #category : #accessing }
GtkTextView >> textBuffer: aTextBuffer [ 

	self setBuffer: aTextBuffer.
	textBuffer := aTextBuffer
]

{ #category : #accessing }
GtkTextView >> vAdjustment [

	^ self ffiCall: #(GtkAdjustment *gtk_scrollable_get_vadjustment (self))
]

{ #category : #accessing }
GtkTextView >> vAdjustment: adjustment [

	^ self ffiCall: #(void gtk_scrollable_set_vadjustment (self, GtkAdjustment *adjustment))
]

{ #category : #accessing }
GtkTextView >> wrapMode [ 

	^ self ffiCall: #(GtkWrapMode gtk_text_view_get_wrap_mode(self))
]
