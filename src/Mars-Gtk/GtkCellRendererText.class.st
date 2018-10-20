"
GtkCellRendererText
GtkCellRendererText — Renders text in a cell

https://developer.gnome.org/gtk3/stable/GtkCellRendererText.html#gtk-cell-renderer-text-new
"
Class {
	#name : #GtkCellRendererText,
	#superclass : #GObject,
	#category : #'Mars-Gtk-Widget-CellRenderers'
}

{ #category : #'instance creation' }
GtkCellRendererText class >> new [
	
	^ self newTextRenderer initialize
]

{ #category : #'instance creation' }
GtkCellRendererText class >> newTextRenderer [

	^ self ffiCall: #(#GtkCellRendererText *gtk_cell_renderer_text_new (void))
]
