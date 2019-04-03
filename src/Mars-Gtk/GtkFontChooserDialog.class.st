"
GtkFontChooserDialog — A dialog for selecting fonts

https://developer.gnome.org/gtk3/stable/GtkFontChooserDialog.html
"
Class {
	#name : #GtkFontChooserDialog,
	#superclass : #GtkSystemDialog,
	#category : #'Mars-Gtk-Widget-Window'
}

{ #category : #examples }
GtkFontChooserDialog class >> example [ 

	(self newTitle: 'Choose Font') 
		showAll; 
		run
]

{ #category : #private }
GtkFontChooserDialog class >> fontChooserDialogNewTitle: title [

	^ self ffiCall: #(GtkFontChooserDialog *gtk_font_chooser_dialog_new (const gchar *title, NULL))
]

{ #category : #'instance creation' }
GtkFontChooserDialog class >> newTitle: aString [ 

	^ (self fontChooserDialogNewTitle: aString) initialize
]

{ #category : #accessing }
GtkFontChooserDialog >> fontDescription [

	^ self ffiCall: #(PangoFontDescription *gtk_font_chooser_get_font_desc (self))
]

{ #category : #accessing }
GtkFontChooserDialog >> fontFamily [

	^ self ffiCall: #(PangoFontFamily *gtk_font_chooser_get_font_family (self))
]

{ #category : #accessing }
GtkFontChooserDialog >> fontMap: fontmap [

	^ self ffiCall: #(void gtk_font_chooser_set_font_map (self, PangoFontMap *fontmap))
]

{ #category : #accessing }
GtkFontChooserDialog >> fontSize [

	^ self ffiCall: #(gint gtk_font_chooser_get_font_size (self))
]
