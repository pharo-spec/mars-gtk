"
I'm a helper object to provide a non-existing notion on Gtk: the concept of a page (with title and contents) to be added into a Notebook.
I provide an API to access and modify this reified concepts (e.g. changing labels, etc.) 
"
Class {
	#name : #GtkNotebookPage,
	#superclass : #Object,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'notebook',
		'label',
		'content',
		'data'
	],
	#pools : [
		'GtkOrientation',
		'GtkTypes'
	],
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #'instance creation' }
GtkNotebookPage class >> new [ 

	self error: 'Use newNotebook:label:page:'
]

{ #category : #'instance creation' }
GtkNotebookPage class >> newNotebook: aNotebook label: labelWidget content: pageWidget [

	^ self basicNew 
		initializeNotebook: aNotebook 
			label: labelWidget 
			content: pageWidget;
		yourself
]

{ #category : #accessing }
GtkNotebookPage >> content [

	^ content
]

{ #category : #accessing }
GtkNotebookPage >> data [
	"using data to store any information to easy access. 
	 (I can store the model of the page, for example)"

	^ data
]

{ #category : #accessing }
GtkNotebookPage >> data: anObject [
	data := anObject
]

{ #category : #initialization }
GtkNotebookPage >> initializeNotebook: aNotebook label: labelWidget content: contentWidget [

	self initialize.
	notebook := aNotebook.
	label := labelWidget.
	content := contentWidget
]

{ #category : #accessing }
GtkNotebookPage >> label [
	^ label
]

{ #category : #accessing }
GtkNotebookPage >> notebook [
	^ notebook
]

{ #category : #accessing }
GtkNotebookPage >> select [ 

	self select: self zIndex
]

{ #category : #private }
GtkNotebookPage >> select: page_num [

	^ self ffiCall: #(void gtk_notebook_set_current_page (
		GtkNotebook *notebook,
		gint page_num))
]

{ #category : #private }
GtkNotebookPage >> setLabel [

	^ self ffiCall: #(void gtk_notebook_set_tab_label (
		GtkNotebook *notebook,
		GtkWidget *content,
		GtkWidget *label))
	
]

{ #category : #accessing }
GtkNotebookPage >> updateLabel: aWidget [

	label := aWidget.
	self setLabel
	
]

{ #category : #enumerating }
GtkNotebookPage >> withAllChildrenDo: aBlock [
	
	aBlock cull: self label.
	aBlock cull: self content
]

{ #category : #accessing }
GtkNotebookPage >> zIndex [
	"the index of this page in the notebook.
	 This is zero based"

	^ (self notebook children indexOf: self) - 1
]
