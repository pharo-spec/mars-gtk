"
The “row-activated” signal

void
user_function (GtkTreeView       *tree_view,
               GtkTreePath       *path,
               GtkTreeViewColumn *column,
               gpointer           user_data)

The ""row-activated"" signal is emitted when the method gtk_tree_view_row_activated() is called, when the user double clicks a treeview row with the ""activate-on-single-click"" property set to FALSE, or when the user single clicks a row when the ""activate-on-single-click"" property set to TRUE. It is also emitted when a non-editable row is selected and one of the keys: Space, Shift+Space, Return or Enter is pressed.
For selection handling refer to the tree widget conceptual overview as well as GtkTreeSelection.
"
Class {
	#name : #GRowActivatedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Mars-Gtk-Base-Callbacks'
}

{ #category : #accessing }
GRowActivatedCallback class >> signalName [

	^ 'row-activated'
]

{ #category : #accessing }
GRowActivatedCallback >> do: aBlock [ 

	^ self
		signature: self signature
		block: [ :treeView :pathHandle :columnHandle :userData | 
			aBlock cull: (GtkTreePath fromHandle: pathHandle) ]
]

{ #category : #accessing }
GRowActivatedCallback >> signature [

	^  #(void (void *treeView, void *path, void *column, void *userData))
]
