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
	#category : #'Mars-Gtk-Widget-Container'
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
GtkNotebook >> append: aPage [

	pages add: aPage.
	self 
		appendPageChild: aPage content
		label: aPage label
]

{ #category : #accessing }
GtkNotebook >> append: child label: label [
	| page |

	page := self newPageLabel: label content: child.
	self append: page
]

{ #category : #private }
GtkNotebook >> appendPageChild: child label: tab_label [

	^ self ffiCall: #(gint gtk_notebook_append_page (self, GtkWidget *child, GtkWidget *tab_label))
]

{ #category : #accessing }
GtkNotebook >> children [ 

	^ pages
]

{ #category : #signals }
GtkNotebook >> connectSwitchPage: aBlock [
	"triggers when a page has been switched (by user or program).
	 aBlock receives the index of the switched page"

	self 
		connect: 'switch-page' 
		signature: #(void (void *notebook, void *page, guint page_num, gpointer user_data))
		do: [ :notebook :page :page_num :user_data | aBlock value: (self children at: page_num + 1) ]
]

{ #category : #initialization }
GtkNotebook >> initialize [

	super initialize.
	pages := OrderedCollection new
]

{ #category : #factory }
GtkNotebook >> newPageLabel: labelWidget content: pageWidget [

	^ GtkNotebookPage 
		newNotebook: self
		label: labelWidget
		content: pageWidget
]

{ #category : #accessing }
GtkNotebook >> pageWithData: anObject [
	"utility to find child with associated data (useful to map operations)"
	
	^ self children detect: [ :each | each data = anObject ] 
]
