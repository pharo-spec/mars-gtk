"
GtkComboBox — A widget used to choose from a list of items

https://developer.gnome.org/gtk3/stable/GtkComboBox.html
"
Class {
	#name : #GtkComboBox,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget'
}

{ #category : #private }
GtkComboBox class >> comboBoxNew [

	^ self ffiCall: #(GtkComboBox *gtk_combo_box_new (void))
]

{ #category : #'instance creation' }
GtkComboBox class >> new [

	^ self comboBoxNew initialize
]
