"
GtkSeparatorToolItem
GtkSeparatorToolItem — A toolbar item that separates groups of other toolbar items

https://developer.gnome.org/gtk3/stable/GtkSeparatorToolItem.html
"
Class {
	#name : #GtkSeparatorToolItem,
	#superclass : #GtkToolItem,
	#category : #'Mars-Gtk-Widget-Toolbar'
}

{ #category : #accessing }
GtkSeparatorToolItem class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_separator_tool_item_get_type())
]

{ #category : #'instance creation' }
GtkSeparatorToolItem class >> new [
	^ self separatorToolItemNew initialize
]

{ #category : #private }
GtkSeparatorToolItem class >> separatorToolItemNew [
	^ self ffiCall: #(GtkSeparatorToolItem *gtk_separator_tool_item_new (void))
]

{ #category : #accessing }
GtkSeparatorToolItem >> draw: draw [
	^ self ffiCall: #(void gtk_separator_tool_item_set_draw (self, gboolean draw))
]

{ #category : #initialization }
GtkSeparatorToolItem >> initialize [ 
	super initialize.
	self draw: true
]

{ #category : #testing }
GtkSeparatorToolItem >> isDraw [
	^ self ffiCall: #(gboolean gtk_separator_tool_item_get_draw (self))
]
