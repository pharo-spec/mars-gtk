"
GtkEntry — A single line text entry field.

https://developer.gnome.org/gtk3/stable/GtkEntry.html
"
Class {
	#name : #GtkEntry,
	#superclass : #GtkWidget,
	#pools : [
		'GtkInputPurpose'
	],
	#category : #'Mars-Gtk-Widget-Input'
}

{ #category : #private }
GtkEntry class >> entryNew [
	^ self ffiCall: #(GtkEntry *gtk_entry_new ())
]

{ #category : #'instance creation' }
GtkEntry class >> new [ 
	^ self entryNew initialize
]

{ #category : #accessing }
GtkEntry >> activatesDefault [

	^ self ffiCall: #(gboolean gtk_entry_get_activates_default (self))
]

{ #category : #accessing }
GtkEntry >> activatesDefault: setting [

	self ffiCall: #(void gtk_entry_set_activates_default (self, gboolean setting))
]

{ #category : #private }
GtkEntry >> basicInvisibleCharacter [

	^ self ffiCall: #(gunichar gtk_entry_get_invisible_char (self))
]

{ #category : #private }
GtkEntry >> basicInvisibleCharacter: aCharacter [

	self ffiCall: #(void gtk_entry_set_invisible_char (self, gunichar aCharacter))
]

{ #category : #private }
GtkEntry >> basicPlaceHolderText [

	^ self ffiCall: #(String gtk_entry_get_placeholder_text (self))
]

{ #category : #private }
GtkEntry >> basicPlaceHolderText: text [

	self ffiCall: #(void gtk_entry_set_placeholder_text (self, String text))
]

{ #category : #private }
GtkEntry >> basicText [
	^ self ffiCall: #(String gtk_entry_get_text (self))
]

{ #category : #private }
GtkEntry >> basicText: text [
	
	self ffiCall: #(void gtk_entry_set_text (self, String text))
]

{ #category : #accessing }
GtkEntry >> beAlphabetic [

	self inputPurpose: GTK_INPUT_PURPOSE_ALPHA
]

{ #category : #accessing }
GtkEntry >> beDigits [

	self inputPurpose: GTK_INPUT_PURPOSE_DIGITS
]

{ #category : #accessing }
GtkEntry >> beEmail [

	self inputPurpose: GTK_INPUT_PURPOSE_EMAIL
]

{ #category : #accessing }
GtkEntry >> beForAnyCharacter [

	self inputPurpose: GTK_INPUT_PURPOSE_FREE_FORM
]

{ #category : #accessing }
GtkEntry >> beName [

	self inputPurpose: GTK_INPUT_PURPOSE_NAME
]

{ #category : #accessing }
GtkEntry >> beNumber [

	self inputPurpose: GTK_INPUT_PURPOSE_NUMBER
]

{ #category : #accessing }
GtkEntry >> bePassword [

	self inputPurpose: GTK_INPUT_PURPOSE_PASSWORD
]

{ #category : #accessing }
GtkEntry >> bePhone [

	self inputPurpose: GTK_INPUT_PURPOSE_PHONE
]

{ #category : #accessing }
GtkEntry >> bePin [

	self inputPurpose: GTK_INPUT_PURPOSE_PIN
]

{ #category : #accessing }
GtkEntry >> beUrl [

	self inputPurpose: GTK_INPUT_PURPOSE_URL
]

{ #category : #signals }
GtkEntry >> connectChanged: aBlock [

	self connect: 'changed' do: aBlock
]

{ #category : #signals }
GtkEntry >> connectPopulatePopup: aBlock [

	^ (GPopulatePopupCallback do: aBlock) connectTo: self
]

{ #category : #private }
GtkEntry >> convertGunichar: unichar toUtf8InBuffer: buffer [

	^ self ffiCall: #(gint g_unichar_to_utf8 (gunichar unichar, String buffer)) module: GLibLibrary
]

{ #category : #private }
GtkEntry >> g_ucs4_to_utf8: aUCS4Character [

	| buffer read |
	buffer := ByteArray new: 4.
	read := self convertGunichar: aUCS4Character toUtf8InBuffer: buffer.
	^ buffer copyFrom: 1 to: read.
]

{ #category : #private }
GtkEntry >> g_utf8_to_ucs4: aString [

	^ self ffiCall: #(gunichar g_utf8_get_char(String aString)) module: GLibLibrary
]

{ #category : #accessing }
GtkEntry >> inputPurpose [
	
	^ self ffiCall: #(GtkInputPurpose gtk_entry_get_input_purpose (self))
]

{ #category : #private }
GtkEntry >> inputPurpose: purpose [
	
	^ self ffiCall: #(void gtk_entry_set_input_purpose (self, GtkInputPurpose purpose))
]

{ #category : #accessing }
GtkEntry >> invisibleCharacter [

	^ (self g_ucs4_to_utf8: self basicInvisibleCharacter) utf8Decoded
]

{ #category : #accessing }
GtkEntry >> invisibleCharacter: aCharacter [

	self basicInvisibleCharacter: (self g_utf8_to_ucs4: aCharacter)
]

{ #category : #accessing }
GtkEntry >> isPassword [

	^ self inputPurpose = GTK_INPUT_PURPOSE_PASSWORD
]

{ #category : #accessing }
GtkEntry >> maxLength [

	^ self ffiCall: #(gint gtk_entry_get_max_length (self))
]

{ #category : #accessing }
GtkEntry >> maxLength: length [

	self ffiCall: #(void gtk_entry_set_max_length (self, gint length))
]

{ #category : #accessing }
GtkEntry >> placeHolderText [
	
	^ self basicPlaceHolderText
]

{ #category : #accessing }
GtkEntry >> placeHolderText: text [
	
	self basicPlaceHolderText: text
]

{ #category : #accessing }
GtkEntry >> progress [

	^ self ffiCall: #(gdouble gtk_entry_get_progress_fraction (self))
]

{ #category : #accessing }
GtkEntry >> progress: fraction [

	^ self ffiCall: #(void gtk_entry_set_progress_fraction (self, gdouble fraction))
]

{ #category : #selection }
GtkEntry >> selectAll [

	self selectFrom: 0 to: -1
]

{ #category : #selection }
GtkEntry >> selectFrom: start_pos to: end_pos [

	^ self ffiCall: #(void gtk_editable_select_region (self, gint start_pos, gint end_pos))
]

{ #category : #accessing }
GtkEntry >> text [
	
	^ self basicText
]

{ #category : #accessing }
GtkEntry >> text: text [
	
	self basicText: text
]

{ #category : #accessing }
GtkEntry >> unsetInvisibleCharacter [

	self ffiCall: #(void gtk_entry_unset_invisible_char (self))
]

{ #category : #accessing }
GtkEntry >> visibility [

	^ self ffiCall: #(gboolean gtk_entry_get_visibility (self))
]

{ #category : #accessing }
GtkEntry >> visibility: aBoolean [

	^ self ffiCall: #(void gtk_entry_set_visibility (self, gboolean aBoolean))
]
