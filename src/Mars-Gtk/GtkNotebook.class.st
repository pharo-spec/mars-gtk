"
I'm a  tabbed notebook container.

https://developer.gnome.org/gtk3/stable/GtkNotebook.html
"
Class {
	#name : #GtkNotebook,
	#superclass : #GtkContainer,
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

	self add: aPage
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

{ #category : #private }
GtkNotebook >> basicAdd: aPage [

	self 
		appendPageChild: aPage content
		label: aPage label
]

{ #category : #private }
GtkNotebook >> basicRemove: aPage [
 
	self removePageIndex: aPage zIndex
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
	
	^ self 
		pageWithData: anObject 
		ifNone: [ NotFound signalFor: anObject ]
]

{ #category : #accessing }
GtkNotebook >> pageWithData: anObject ifNone: aBlock [
	"utility to find child with associated data (useful to map operations)"
	
	^ self children 
		detect: [ :each | each data = anObject ]
		ifNone: aBlock
]

{ #category : #private }
GtkNotebook >> removePageIndex: page_num [
	
	self ffiCall: #(void gtk_notebook_remove_page (self, gint page_num))
]
