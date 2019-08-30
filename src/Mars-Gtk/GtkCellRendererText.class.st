"
GtkCellRendererText
GtkCellRendererText — Renders text in a cell

https://developer.gnome.org/gtk3/stable/GtkCellRendererText.html#gtk-cell-renderer-text-new
"
Class {
	#name : #GtkCellRendererText,
	#superclass : #GtkCellRenderer,
	#category : #'Mars-Gtk-Widget-CellRenderers'
}

{ #category : #private }
GtkCellRendererText class >> cellRendererNew [

	^ self ffiCall: #(GtkCellRendererText *gtk_cell_renderer_text_new (void))
]

{ #category : #accessing }
GtkCellRendererText class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_cell_renderer_text_init(void *object))
]

{ #category : #accessing }
GtkCellRendererText class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_cell_renderer_text_get_type())
]

{ #category : #accessing }
GtkCellRendererText >> beEditable [

	self editable: true
]

{ #category : #signaling }
GtkCellRendererText >> connectEdited: aBlock [
	"I use a block with two arguments: 
	 aRenderer connectEdited: [ :path :newText | ... ] "

	^ self 
		connect: 'edited'  
		signature: #(void (void *renderer, void *path, void *new_text, gpointer data))  
		do: [ :renderer :path :new_text :data |
			aBlock 
				value: path readStringUTF8 
				value: new_text readStringUTF8 ]
]

{ #category : #private }
GtkCellRendererText >> editable: aBoolean [

	self 
		gObjectSet: 'editable' 
		toBoolean: aBoolean
]

{ #category : #testing }
GtkCellRendererText >> isEditable [

	^ self gObjectGetBoolean: 'editable'
]
