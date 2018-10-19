"
GtkCellRendererText
GtkCellRendererText — Renders text in a cell

https://developer.gnome.org/gtk3/stable/GtkCellRendererText.html#gtk-cell-renderer-text-new
"
Class {
	#name : #GtkCellTextRenderer,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-CellRenderers'
}

{ #category : #'instance creation' }
GtkCellTextRenderer class >> new [
	
	^ self newTextRenderer initialize
]

{ #category : #'instance creation' }
GtkCellTextRenderer class >> newTextRenderer [

	^ self ffiCall: #(GtkCellTextRenderer *gtk_cell_renderer_text_new (void))
]
