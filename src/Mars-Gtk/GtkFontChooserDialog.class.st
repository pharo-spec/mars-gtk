"
GtkFontChooserDialog — A dialog for selecting fonts

https://developer.gnome.org/gtk3/stable/GtkFontChooserDialog.html
"
Class {
	#name : #GtkFontChooserDialog,
	#superclass : #GtkSystemDialog,
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #private }
GtkFontChooserDialog class >> fontChooserDialogNewTitle: title [

	^ self ffiCall: #(GtkFontChooserDialog *gtk_font_chooser_dialog_new (const gchar *title, NULL))
]

{ #category : #'instance creation' }
GtkFontChooserDialog class >> newTitle: aString [ 

	^ (self fontChooserDialogNewTitle: aString) initialize
]
