"
GtkCellRendererPixbuf — Renders a pixbuf in a cell

https://developer.gnome.org/gtk3/unstable/GtkCellRendererPixbuf.html
"
Class {
	#name : #GtkCellRendererPixbuf,
	#superclass : #GtkCellRenderer,
	#category : #'Mars-Gtk-Widget-CellRenderers'
}

{ #category : #private }
GtkCellRendererPixbuf class >> cellRendererNew [

	^ self ffiCall: #(GtkCellRendererPixbuf *gtk_cell_renderer_pixbuf_new (void))
]
