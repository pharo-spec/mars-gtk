"
GtkComboBoxText — A simple, text-only combo box

https://developer.gnome.org/gtk3/stable/GtkComboBoxText.html
"
Class {
	#name : #GtkComboBoxText,
	#superclass : #GtkComboBox,
	#category : #'Mars-Gtk-Widget-Input'
}

{ #category : #private }
GtkComboBoxText class >> comboBoxTextNew [ 

	^ self ffiCall: #(GtkComboBoxText *gtk_combo_box_text_new (void))
]

{ #category : #private }
GtkComboBoxText class >> comboBoxTextNewWithEntry [ 

	^ self ffiCall: #(GtkComboBoxText *gtk_combo_box_text_new_with_entry (void))
]

{ #category : #'instance creation' }
GtkComboBoxText class >> new [

	^ self comboBoxTextNew initialize
]

{ #category : #'instance creation' }
GtkComboBoxText class >> newWithEntry [

	^ self comboBoxTextNewWithEntry initialize
]

{ #category : #accessing }
GtkComboBoxText >> activeText [

	^ self basicActiveText asByteArray utf8Decoded
]

{ #category : #accessing }
GtkComboBoxText >> append: text [

	^ self basicAppend: text utf8Encoded asString
]

{ #category : #accessing }
GtkComboBoxText >> append: text id: id [

	^ self 
		basicAppend: text utf8Encoded asString 
		id: id utf8Encoded asString
]

{ #category : #private }
GtkComboBoxText >> basicActiveText [

	^ self ffiCall: #(String gtk_combo_box_text_get_active_text (self))
]

{ #category : #private }
GtkComboBoxText >> basicAppend: utf8EncodedText [

	^ self ffiCall: #(void gtk_combo_box_text_append_text (self, String utf8EncodedText)) 
]

{ #category : #private }
GtkComboBoxText >> basicAppend: utf8EncodedText id: utf8EncodedId [

	^ self ffiCall: #(void gtk_combo_box_text_append (self, String utf8EncodedId, String utf8EncodedText)) 
]

{ #category : #private }
GtkComboBoxText >> basicInsertAt: position text: utf8EncodedText [

	self ffiCall: #(void gtk_combo_box_text_insert_text (
		self,
		gint position,
		String utf8EncodedText)) 
]

{ #category : #private }
GtkComboBoxText >> basicInsertAt: position text: utf8EncodedText id: utf8EncodedId [

	self ffiCall: #(void gtk_combo_box_text_insert (
		self,
		gint position,
		String utf8EncodedId,
		String utf8EncodedText)) 
]

{ #category : #private }
GtkComboBoxText >> basicPrepend: utf8EncodedText [

	^ self ffiCall: #(void gtk_combo_box_text_preppend_text (self, String utf8EncodedText)) 
]

{ #category : #private }
GtkComboBoxText >> basicPrepend: utf8EncodedText id: utf8EncodedId [

	^ self ffiCall: #(void gtk_combo_box_text_prepend (self, String utf8EncodedId, String utf8EncodedText)) 
]

{ #category : #accessing }
GtkComboBoxText >> insertAt: position text: text [

	self basicInsertAt: position text: text utf8Encoded asString
]

{ #category : #accessing }
GtkComboBoxText >> insertAt: position text: text id: id [

	self basicInsertAt: position text: text utf8Encoded asString id: id utf8Encoded asString
]

{ #category : #accessing }
GtkComboBoxText >> prepend: text [

	^ self basicPrepend: text utf8Encoded asString
]

{ #category : #accessing }
GtkComboBoxText >> prepend: text id: id [

	^ self basicPrepend: text utf8Encoded asString id: id utf8Encoded asString
]

{ #category : #accessing }
GtkComboBoxText >> removeAll [ 

	^ self ffiCall: #(void gtk_combo_box_text_remove_all (self))
]

{ #category : #accessing }
GtkComboBoxText >> removeAt: position [

	^ self ffiCall: #(void gtk_combo_box_text_remove (self, gint position))
]
