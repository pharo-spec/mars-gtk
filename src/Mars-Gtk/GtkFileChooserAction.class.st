"
enum GtkFileChooserAction
Describes whether a GtkFileChooser is being used to open existing files or to save to a possibly new file.

https://developer.gnome.org/gtk3/stable/GtkFileChooser.html#GtkFileChooserAction
"
Class {
	#name : #GtkFileChooserAction,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER',
		'GTK_FILE_CHOOSER_ACTION_OPEN',
		'GTK_FILE_CHOOSER_ACTION_SAVE',
		'GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER'
	],
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #'accessing enum' }
GtkFileChooserAction class >> GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER [
	"This method was automatically generated"
	^ GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER
]

{ #category : #'accessing enum' }
GtkFileChooserAction class >> GTK_FILE_CHOOSER_ACTION_OPEN [
	"This method was automatically generated"
	^ GTK_FILE_CHOOSER_ACTION_OPEN
]

{ #category : #'accessing enum' }
GtkFileChooserAction class >> GTK_FILE_CHOOSER_ACTION_SAVE [
	"This method was automatically generated"
	^ GTK_FILE_CHOOSER_ACTION_SAVE
]

{ #category : #'accessing enum' }
GtkFileChooserAction class >> GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER [
	"This method was automatically generated"
	^ GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER
]

{ #category : #'enum declaration' }
GtkFileChooserAction class >> enumDecl [
	
	^ #(
	GTK_FILE_CHOOSER_ACTION_OPEN 				0
	GTK_FILE_CHOOSER_ACTION_SAVE 				1
	GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER 	2
	GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER 	3
	)
	
]
