"
I'm a  tabbed notebook container.

https://developer.gnome.org/gtk3/stable/GtkNotebook.html
"
Class {
	#name : #GtkNotebook,
	#superclass : #GtkContainer,
	#instVars : [
		'pages'
	],
	#pools : [
		'GtkOrientation'
	],
	#category : 'Mars-Gtk-Container'
}

{ #category : #'instance creation' }
GtkNotebook class >> new [
	^ self notebookNew initialize 
]

{ #category : #private }
GtkNotebook class >> notebookNew [
	^ self ffiCall: #(GtkNotebook *gtk_notebook_new (void))
]

{ #category : #accessing }
GtkNotebook >> append: child label: label [
	pages at: label put: child.
	self appendPageChild: child label: label
]

{ #category : #private }
GtkNotebook >> appendPageChild: child label: tab_label [
	^ self ffiCall: #(gint gtk_notebook_append_page (self, GtkWidget *child, GtkWidget *tab_label))
]

{ #category : #initialization }
GtkNotebook >> initialize [
	super initialize.
	pages := OrderedDictionary new
]
