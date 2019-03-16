"
GtkCheckButton
GtkCheckButton — Create widgets with a discrete toggle button

https://developer.gnome.org/gtk3/unstable/GtkCheckButton.html
"
Class {
	#name : #GtkCheckButton,
	#superclass : #GtkToggleButton,
	#category : #'Mars-Gtk-Widget-Buttons'
}

{ #category : #private }
GtkCheckButton class >> buttonNew [

	^ self ffiCall: #(GtkCheckButton* gtk_check_button_new (void))
]

{ #category : #private }
GtkCheckButton class >> buttonNewWithLabel: utf8EncodedString [

	^ self ffiCall: #(GtkCheckButton *gtk_check_button_new_with_label (String utf8EncodedString))
]
