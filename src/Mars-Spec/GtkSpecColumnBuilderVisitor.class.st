Class {
	#name : #GtkSpecColumnBuilderVisitor,
	#superclass : #GtkSpecColumnVisitor,
	#instVars : [
		'treeView'
	],
	#category : #'Mars-Spec-Adapter'
}

{ #category : #accessing }
GtkSpecColumnBuilderVisitor >> treeView: aGtkTreeView [

	treeView := aGtkTreeView
]

{ #category : #visiting }
GtkSpecColumnBuilderVisitor >> visitStringColumn: aTableColumn [
	| renderer | 

	renderer := GtkCellRendererText new.
	treeView appendColumn: (GtkTreeViewColumn new
		packStart: renderer;
		addAttribute: 'text' 
			column: (self index - 1) 
			renderer: renderer;
		yourself)
]
