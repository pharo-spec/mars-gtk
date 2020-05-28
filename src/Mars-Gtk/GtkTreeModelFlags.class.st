Class {
	#name : #GtkTreeModelFlags,
	#superclass : #GtkEnumeration,
	#classVars : [
		'GTK_TREE_MODEL_ITERS_PERSIST',
		'GTK_TREE_MODEL_LIST_ONLY'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'accessing enum' }
GtkTreeModelFlags class >> GTK_TREE_MODEL_ITERS_PERSIST [
	"This method was automatically generated"
	^ GTK_TREE_MODEL_ITERS_PERSIST
]

{ #category : #'accessing enum' }
GtkTreeModelFlags class >> GTK_TREE_MODEL_LIST_ONLY [
	"This method was automatically generated"
	^ GTK_TREE_MODEL_LIST_ONLY
]

{ #category : #'enum declaration' }
GtkTreeModelFlags class >> enumDecl [
	"self initializeEnumeration"

	^ #(
	GTK_TREE_MODEL_ITERS_PERSIST 		1
	GTK_TREE_MODEL_LIST_ONLY 			2
	)
]
