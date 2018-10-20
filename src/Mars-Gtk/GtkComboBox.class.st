"
GtkComboBox — A widget used to choose from a list of items

https://developer.gnome.org/gtk3/stable/GtkComboBox.html
"
Class {
	#name : #GtkComboBox,
	#superclass : #GtkBin,
	#instVars : [
		'model',
		'columns'
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

{ #category : #TOREFACTOR }
GtkComboBox >> beText [
	"I'm assuming there is just one column. 
	 And that it will be a text column. 
	 I'm asuming a lot of things :P"
	
	columns := { GtkCellRendererText new }.
	self cellLayoutPackStart: columns first expand: true
]

{ #category : #TOREFACTOR }
GtkComboBox >> cellLayoutPackStart: cell expand: expand [

	self ffiCall: #(void gtk_cell_layout_pack_start (self, GtkCellRenderer *cell, gboolean expand))
]

{ #category : #accessing }
GtkComboBox >> model: aTreeModel [

	model := aTreeModel.
	self setModel: aTreeModel
]

{ #category : #private }
GtkComboBox >> setModel: aTreeModel [

	^ self ffiCall: #(void gtk_combo_box_set_model (self, GObject *aTreeModel))
]
