"
Simplified version of GtkTreeView to display lists
GtkTreeView — A widget for displaying both trees and lists

https://developer.gnome.org/gtk3/stable/GtkTreeView.html
"
Class {
	#name : #GtkListView,
	#superclass : #GtkContainer,
	#instVars : [
		'listStore'
	],
	#category : #'Mars-Gtk-Widget-List'
}

{ #category : #'instance creation' }
GtkListView class >> basicNewListView [

	^ self ffiCall: #(GtkListView *gtk_tree_view_new (void))
]

{ #category : #'instance creation' }
GtkListView class >> new [

	^ self basicNewListView initialize
]

{ #category : #accessing }
GtkListView >> appendColumn: column [
	
	self ffiCall: #(gint gtk_tree_view_append_column (self, GtkTreeViewColumn *column))
]

{ #category : #accessing }
GtkListView >> model [

	^ self ffiCall: #(GtkListStore gtk_tree_view_get_model (self))
]

{ #category : #accessing }
GtkListView >> model: aListStore [

	listStore := aListStore.
	self setModel: aListStore 
]

{ #category : #accessing }
GtkListView >> newColumn [

	| column |
	column := GtkTreeViewColumn new.
	self appendColumn: column.
	^ column
]

{ #category : #private }
GtkListView >> setModel: aListStore [

	^ self ffiCall: #(void gtk_tree_view_set_model (self, GtkListStore* aListStore))
]
