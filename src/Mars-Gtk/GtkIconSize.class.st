"
Built-in stock icon sizes.

https://developer.gnome.org/gtk3/stable/gtk3-Themeable-Stock-Images.html#GtkIconSize
"
Class {
	#name : #GtkIconSize,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_ICON_SIZE_BUTTON',
		'GTK_ICON_SIZE_DIALOG',
		'GTK_ICON_SIZE_DND',
		'GTK_ICON_SIZE_INVALID',
		'GTK_ICON_SIZE_LARGE_TOOLBAR',
		'GTK_ICON_SIZE_MENU',
		'GTK_ICON_SIZE_SMALL_TOOLBAR'
	],
	#category : #'Mars-Gtk-Misc'
}

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_BUTTON [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_BUTTON
]

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_DIALOG [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_DIALOG
]

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_DND [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_DND
]

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_INVALID [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_INVALID
]

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_LARGE_TOOLBAR [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_LARGE_TOOLBAR
]

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_MENU [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_MENU
]

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_SMALL_TOOLBAR [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_SMALL_TOOLBAR
]

{ #category : #'enum declaration' }
GtkIconSize class >> enumDecl [
	^ #(
	GTK_ICON_SIZE_INVALID 				0
	GTK_ICON_SIZE_MENU 					1
	GTK_ICON_SIZE_SMALL_TOOLBAR 		2
	GTK_ICON_SIZE_LARGE_TOOLBAR 		3
	GTK_ICON_SIZE_BUTTON 					4
	GTK_ICON_SIZE_DND 						5
	GTK_ICON_SIZE_DIALOG 					6)
]
