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
GtkCellRendererText class >> cellRendererTextNew [

	^ self ffiCall: #(GtkCellRendererText *gtk_cell_renderer_text_new (void))
]

{ #category : #'instance creation' }
GtkCellRendererText class >> new [
	
	^ self cellRendererTextNew initialize
]
