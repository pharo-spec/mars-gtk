Class {
	#name : #GtkSeparatorToolItem,
	#superclass : #GtkToolItem,
	#category : 'Mars-Gtk-Widget'
}

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

{ #category : #testing }
GtkSeparatorToolItem >> isDraw [
	^ self ffiCall: #(gboolean gtk_separator_tool_item_get_draw (self))
]
