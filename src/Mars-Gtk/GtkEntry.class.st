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
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkEntry class >> entryNew [
	^ self ffiCall: #(GtkEntry *gtk_entry_new ())
]

{ #category : #'instance creation' }
GtkEntry class >> new [ 
	^ self entryNew initialize
]

{ #category : #testing }
GtkEntry >> activatesDefault [

	^ self ffiCall: #(gboolean gtk_entry_get_activates_default (self))
]

{ #category : #accessing }
GtkEntry >> activatesDefault: setting [

	self ffiCall: #(void gtk_entry_set_activates_default (self, gboolean setting))
]

{ #category : #accessing }
GtkEntry >> beNumber [

	self inputPurpose: GTK_INPUT_PURPOSE_NUMBER
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
GtkEntry >> placeHolderText: text [
	self ffiCall: #(void gtk_entry_set_placeholder_text (self, const gchar *text))
]

{ #category : #accessing }
GtkEntry >> text [
	self ffiCall: #(const gchar *gtk_entry_get_text (self))
]

{ #category : #accessing }
GtkEntry >> text: text [
	self ffiCall: #(void gtk_entry_set_text (self, const gchar *text))
]
