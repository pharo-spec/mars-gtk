"
GtkComboBox — A widget used to choose from a list of items

https://developer.gnome.org/gtk3/stable/GtkComboBox.html
"
Class {
	#name : #GtkComboBox,
	#superclass : #GtkBin,
	#instVars : [
		'model'
	],
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

{ #category : #'instance creation' }
GtkComboBox class >> newModel: aTreeModel [

	^ self new model: aTreeModel
]

{ #category : #accessing }
GtkComboBox >> model: aTreeModel [

	model := aTreeModel.
	self setModel: aTreeModel
]

{ #category : #accessing }
GtkComboBox >> setModel: aTreeModel [

	^ self ffiCall: #(void gtk_combo_box_set_model (self, GObject *aTreeModel))
]
