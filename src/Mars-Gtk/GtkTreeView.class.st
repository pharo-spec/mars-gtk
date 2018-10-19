"
Simplified version of GtkTreeView to display lists
GtkTreeView — A widget for displaying both trees and lists

https://developer.gnome.org/gtk3/stable/GtkTreeView.html
"
Class {
	#name : #GtkTreeView,
	#superclass : #GtkContainer,
	#instVars : [
		'listStore'
	],
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #'instance creation' }
GtkTreeView class >> basicNewTreeView [

	^ self ffiCall: #(#GtkTreeView *gtk_tree_view_new (void))
]

{ #category : #'instance creation' }
GtkTreeView class >> new [

	^ self basicNewTreeView initialize
]

{ #category : #private }
GtkTreeView >> addExpanderColumn [

	self ffiCall: #(void gtk_tree_view_set_expander_column(self, 0))
]

{ #category : #accessing }
GtkTreeView >> appendColumn: column [
	
	self ffiCall: #(gint gtk_tree_view_append_column (self, GtkTreeViewColumn *column))
]

{ #category : #private }
GtkTreeView >> enableTreeLines [

	self enableTreeLines: true
]

{ #category : #private }
GtkTreeView >> enableTreeLines: enabled [

	self ffiCall: #(void gtk_tree_view_set_enable_tree_lines (self,
                                     gboolean enabled))
]

{ #category : #accessing }
GtkTreeView >> model [

	^ self ffiCall: #(GtkListStore gtk_tree_view_get_model (self))
]

{ #category : #accessing }
GtkTreeView >> model: aListStore [

	listStore := aListStore.
	self setModel: aListStore getHandle
]

{ #category : #accessing }
GtkTreeView >> newColumn [

	| column |
	column := GtkTreeViewColumn new.
	self appendColumn: column.
	^ column
]

{ #category : #private }
GtkTreeView >> setExpanderColumn: aColumn [

	self ffiCall: #(void gtk_tree_view_set_expander_column(self, GtkTreeViewColumn *aColumn))
]

{ #category : #private }
GtkTreeView >> setModel: aListStore [

	^ self ffiCall: #(void gtk_tree_view_set_model (self, void* aListStore))
]
