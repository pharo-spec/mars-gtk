"
enum GtkTreeViewColumnSizing
The sizing method the column uses to determine its width. Please note that GTK_TREE_VIEW_COLUMN_AUTOSIZE are inefficient for large views, and can make columns appear choppy.

Members
GTK_TREE_VIEW_COLUMN_GROW_ONLY
Columns only get bigger in reaction to changes in the model
 
GTK_TREE_VIEW_COLUMN_AUTOSIZE
Columns resize to be the optimal size everytime the model changes.
 
GTK_TREE_VIEW_COLUMN_FIXED
Columns are a fixed numbers of pixels wide.
"
Class {
	#name : #GtkTreeViewColumnSizing,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_TREE_VIEW_COLUMN_AUTOSIZE',
		'GTK_TREE_VIEW_COLUMN_FIXED',
		'GTK_TREE_VIEW_COLUMN_GROW_ONLY'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'accessing enum' }
GtkTreeViewColumnSizing class >> GTK_TREE_VIEW_COLUMN_AUTOSIZE [
	"This method was automatically generated"
	^ GTK_TREE_VIEW_COLUMN_AUTOSIZE
]

{ #category : #'accessing enum' }
GtkTreeViewColumnSizing class >> GTK_TREE_VIEW_COLUMN_FIXED [
	"This method was automatically generated"
	^ GTK_TREE_VIEW_COLUMN_FIXED
]

{ #category : #'accessing enum' }
GtkTreeViewColumnSizing class >> GTK_TREE_VIEW_COLUMN_GROW_ONLY [
	"This method was automatically generated"
	^ GTK_TREE_VIEW_COLUMN_GROW_ONLY
]

{ #category : #'enum declaration' }
GtkTreeViewColumnSizing class >> enumDecl [
	"self initializeEnumeration"

	^ #(
	GTK_TREE_VIEW_COLUMN_GROW_ONLY 	0 
	GTK_TREE_VIEW_COLUMN_AUTOSIZE 		1
	GTK_TREE_VIEW_COLUMN_FIXED 			2
	)
]
