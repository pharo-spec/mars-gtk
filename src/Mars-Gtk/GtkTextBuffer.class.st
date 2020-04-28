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
GtkTextBuffer class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_text_buffer_get_type())
]

{ #category : #'instance creation' }
GtkTextBuffer class >> newTable: table [ 

	^ (self textBufferNew: table) initialize 
]

{ #category : #private }
GtkTextBuffer class >> textBufferNew: table [

	^ self ffiCall: #(GtkTextBuffer *gtk_text_buffer_new (GtkTextTagTable *table))
]

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

{ #category : #'accessing tags' }
GtkTextBuffer >> applyTagByName: aName start: start end: end [
	| startIter endIter |
	
	startIter := self offsetIter: start.
	endIter := self offsetIter: end.
	self applyTagByName: aName startIter: startIter endIter: endIter
	
	
]

{ #category : #private }
GtkTextBuffer >> applyTagByName: name startIter: start endIter: end [

	self ffiCall: #(void gtk_text_buffer_apply_tag_by_name (
		self,
 		const gchar *name,
		const GtkTextIter *start,
		const GtkTextIter *end))
]

{ #category : #converting }
GtkTextBuffer >> asText [
	| text pos iter atEnd |
	
	text := self text asText.
	iter := self startIter.
	pos := 1.
	atEnd := false.
	[ atEnd ] whileFalse: [ 
		iter tags do: [ :eachTag |
			eachTag asTextAttributeList do: [ :eachAttr | 
				text addAttribute: eachAttr from: pos to: pos ] ].
		pos := pos + 1.
		atEnd := iter forwardChar not ].

	^ text
]

{ #category : #private }
GtkTextBuffer >> beginUserAction [
	
	self ffiCall: #(void gtk_text_buffer_begin_user_action (self))
]

{ #category : #accessing }
GtkTextBuffer >> charCount [

	^ self ffiCall: #(gint gtk_text_buffer_get_char_count (self))
]

{ #category : #signals }
GtkTextBuffer >> connectChanged: aBlock [ 

	(GChangedCallback do: aBlock) connectTo: self
]

{ #category : #signals }
GtkTextBuffer >> connectMarkSet: aBlock [

	self 
		connect: 'mark-set' 
		signature: #(void (void *textBuffer, void *iter, void *mark, gpointer data))
		do: [ :textBuffer :iter :mark :data | 
			aBlock 
				value: (GtkTextIter fromHandle: iter)
				value: (GtkTextMark fromHandle: mark) ]	
]

{ #category : #'accessing mark' }
GtkTextBuffer >> createMarkNamed: mark_name where: where leftGravity: left_gravity [

	^ self ffiCall: #(GtkTextMark *gtk_text_buffer_create_mark (
			self,
			const gchar *mark_name,
			const GtkTextIter *where,
			gboolean left_gravity))
]

{ #category : #accessing }
GtkTextBuffer >> cursorPosition [

	^ self gObjectGetInteger: 'cursor-position'
]

{ #category : #accessing }
GtkTextBuffer >> deleteAll [ 

	self 
		deleteStart: self startIter 
		end: self endIter
]

{ #category : #private }
GtkTextBuffer >> deleteStart: start end: end [

	^ self ffiCall: #(void gtk_text_buffer_delete (self, GtkTextIter *start, GtkTextIter *end))
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
GtkTextBuffer >> endUserAction [
	
	self ffiCall: #(void gtk_text_buffer_end_user_action (self))
]

{ #category : #private }
GtkTextBuffer >> getSelectionBoundsStart: start end: end [ 

	^ self ffiCall: #(gboolean gtk_text_buffer_get_selection_bounds (
		self,
		GtkTextIter *start,
		GtkTextIter *end))
]

{ #category : #private }
GtkTextBuffer >> insertIter: iter text: text [

	^ self ffiCall: #(void gtk_text_buffer_insert (self,
                        GtkTextIter *iter,
                        const gchar *text,
                        -1))
]

{ #category : #'accessing mark' }
GtkTextBuffer >> insertMark [

	^ self ffiCall: #(GtkTextMark *gtk_text_buffer_get_insert (self))
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
GtkTextBuffer >> insertText: aString at: offset [

	self 
		insertIter: (self offsetIter: offset)
		text: aString
]

{ #category : #accessing }
GtkTextBuffer >> insertTextAtCursor: text [

	^ self ffiCall: #(void gtk_text_buffer_insert_at_cursor (self, const gchar *text, -1))
]

{ #category : #accessing }
GtkTextBuffer >> lineCount [

	^ self ffiCall: #(gint gtk_text_buffer_get_line_count (self))
]

{ #category : #'accessing mark' }
GtkTextBuffer >> markNamed: aName [

	^ self ffiCall: #(GtkTextMark *gtk_text_buffer_get_mark (self, const gchar *aName))
]

{ #category : #'accessing mark' }
GtkTextBuffer >> moveMark: mark to: where [

	^ self ffiCall: #(void gtk_text_buffer_move_mark (
		self,
		GtkTextMark *mark,
		const GtkTextIter *where))
]

{ #category : #private }
GtkTextBuffer >> offsetIter: offset [
	| iter |
	
	iter := GtkTextIter new.
	self offsetIter: iter pos: offset.
	^ iter
	
]

{ #category : #private }
GtkTextBuffer >> offsetIter: iter pos: char_offset [
	
	^ self ffiCall: #(void gtk_text_buffer_get_iter_at_offset (self, GtkTextIter *iter, gint char_offset))
	
]

{ #category : #'accessing tags' }
GtkTextBuffer >> removeAllTags [ 

	self 
		removeAllTagsFrom: self startIter 
		to: self endIter
]

{ #category : #private }
GtkTextBuffer >> removeAllTagsFrom: start to: end [

	self ffiCall: #(void gtk_text_buffer_remove_all_tags (
		self, 
		const GtkTextIter *start, 
		const GtkTextIter *end))
]

{ #category : #'accessing selection' }
GtkTextBuffer >> selectAll [

	self 
		selectRangeInsert: self startIter 
		bound: self endIter
]

{ #category : #'accessing selection' }
GtkTextBuffer >> selectFrom: start to: end [
	| startIter endIter |

	startIter := self offsetIter: start.
	endIter := self offsetIter: end.
	self selectRangeInsert: startIter bound: endIter
]

{ #category : #'accessing selection' }
GtkTextBuffer >> selectLineAt: offset [
	| start end |
	
	start := self offsetIter: offset.
	start backwardChars: start lineOffset.

	end := self offsetIter: offset.
	end forwardToLineEnd.
		
	self selectRangeInsert: start bound: end
]

{ #category : #'accessing selection' }
GtkTextBuffer >> selectLineAtCursor [

	self selectLineAt: self cursorPosition
]

{ #category : #private }
GtkTextBuffer >> selectRangeInsert: ins bound: bound [

	self ffiCall: #(void gtk_text_buffer_select_range (
		self,
		const GtkTextIter *ins,
		const GtkTextIter *bound))
]

{ #category : #'accessing selection' }
GtkTextBuffer >> selection [ 
	"answer an interval of current selection"

	^ self 
		selectionIteratorsDo: [ :start :end | start offset to: end offset ] 
		ifNone: [ nil ]
]

{ #category : #'accessing selection' }
GtkTextBuffer >> selectionIteratorsDo: aBlock ifNone: noneBlock [
	"answer an interval of current selection"
	| start end |

	start := GtkTextIter new.
	end := GtkTextIter new.
	^ (self getSelectionBoundsStart: start end: end)
		ifTrue: [ aBlock value: start value: end ]
		ifFalse: noneBlock	
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

{ #category : #accessing }
GtkTextBuffer >> textFrom: start to: end [
	| startIter endIter |

	startIter := self offsetIter: start.
	endIter := self offsetIter: end.
	^ self 
		textStart: self startIter 
		end: self endIter
		includeHiddenChars: false
]

{ #category : #private }
GtkTextBuffer >> textStart: start end: end includeHiddenChars: include_hidden_chars [ 

	self ffiCall: #(String gtk_text_buffer_get_text (
		self,
      const GtkTextIter *start,
      const GtkTextIter *end,
      gboolean include_hidden_chars))
]

{ #category : #accessing }
GtkTextBuffer >> userActionDuring: aBlock [ 

	self beginUserAction.
	aBlock ensure: [ 
		self endUserAction ]
]
