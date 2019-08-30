"
GtkFileChooserDialog — A file chooser dialog, suitable for “File/Open” or “File/Save” commands

https://developer.gnome.org/gtk3/stable/GtkFileChooserDialog.html

"
Class {
	#name : #GtkFileChooserDialog,
	#superclass : #GtkSystemDialog,
	#pools : [
		'GtkFileChooserAction',
		'GtkResponseType'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #accessing }
GtkFileChooserDialog class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_file_chooser_dialog_get_type())
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newOpenDirectoryTitle: aString [

	^ self newOpenDirectoryTitle: aString acceptLabel: 'Open' cancelLabel: 'Cancel' 
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newOpenDirectoryTitle: aString acceptLabel: acceptString cancelLabel: cancelString [

	^ (self 
		newTitle: aString 
		action: GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER
		firstButtonText: cancelString
		firstButtonId: GTK_RESPONSE_CANCEL
		secondButtonText: acceptString
		secondButtonId: GTK_RESPONSE_OK)
		initialize
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newOpenFileTitle: aString [

	^ self newOpenFileTitle: aString acceptLabel: 'Open' cancelLabel: 'Cancel' 
]

{ #category : #'instance creation' }
GtkFileChooserDialog class >> newOpenFileTitle: aString acceptLabel: acceptString cancelLabel: cancelString [

	^ (self 
		newTitle: aString 
		action: GTK_FILE_CHOOSER_ACTION_OPEN 
		firstButtonText: cancelString
		firstButtonId: GTK_RESPONSE_CANCEL
		secondButtonText: acceptString
		secondButtonId: GTK_RESPONSE_OK)
		initialize
]

{ #category : #private }
GtkFileChooserDialog class >> newTitle: title action: action firstButtonText: first_button_text firstButtonId: first_button_id [

	self ffiCall: #(GtkFileChooserDialog *gtk_file_chooser_dialog_new (
		const gchar *title,
		NULL,
		GtkFileChooserAction action,
		const gchar *first_button_text
		GtkResponseType first_button_id,
		NULL))
]

{ #category : #private }
GtkFileChooserDialog class >> newTitle: title action: action firstButtonText: first_button_text firstButtonId: first_button_id secondButtonText: second_button_text secondButtonId: second_button_id [

	self ffiCall: #(GtkFileChooserDialog *gtk_file_chooser_dialog_new (
		const gchar *title,
		NULL,
		GtkFileChooserAction action,
		const gchar *first_button_text,
		GtkResponseType first_button_id,
		const gchar *second_button_text,
		GtkResponseType second_button_id,
		NULL))
]

{ #category : #accessing }
GtkFileChooserDialog >> filename [ 

	self ffiCall: #(gchar *gtk_file_chooser_get_filename (self))
]

{ #category : #accessing }
GtkFileChooserDialog >> filename: filename [

	self ffiCall: #(void *gtk_file_chooser_set_filename (self, const char filename))
]
