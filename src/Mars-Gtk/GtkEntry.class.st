"
GtkEntry — A single line text entry field.

https://developer.gnome.org/gtk3/stable/GtkEntry.html
"
Class {
	#name : #GtkEntry,
	#superclass : #GtkWidget,
	#category : 'Mars-Gtk-Widget'
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
