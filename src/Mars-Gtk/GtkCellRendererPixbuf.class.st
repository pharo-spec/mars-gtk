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
GtkCellRendererPixbuf class >> cellRendererPixbufNew [

	^ self ffiCall: #(GtkCellRendererPixbuf *
gtk_cell_renderer_pixbuf_new (void))
]

{ #category : #'instance creation' }
GtkCellRendererPixbuf class >> new [

	^ self cellRendererPixbufNew initialize
]
