"
GtkCellRenderer — An object for rendering a single cell

https://developer.gnome.org/gtk3/unstable/GtkCellRenderer.html
"
Class {
	#name : #GtkCellRenderer,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-CellRenderers'
}

{ #category : #private }
GtkCellRenderer class >> cellRendererNew [

	self subclassResponsibility
]

{ #category : #accessing }
GtkCellRenderer class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_cell_renderer_init(void *object))
]

{ #category : #accessing }
GtkCellRenderer class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_cell_renderer_get_type())
]

{ #category : #'instance creation' }
GtkCellRenderer class >> new [
	
	^ self cellRendererNew initialize
]

{ #category : #accessing }
GtkCellRenderer >> width [

	^ self gObjectGetInteger: 'width'
]

{ #category : #accessing }
GtkCellRenderer >> width: aNumber [ 

	self gObjectSet: 'width' toInteger: aNumber
]
