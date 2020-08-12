"
I'm an element inside a GtkListBox

https://developer.gnome.org/gtk3/stable/GtkListBox.html
"
Class {
	#name : #GtkListBoxRow,
	#superclass : #GtkBin,
	#category : #'Mars-Gtk-Widget'
}

{ #category : #accessing }
GtkListBoxRow class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_list_box_row_get_type())
]

{ #category : #private }
GtkListBoxRow class >> listBoxRowNew [
	^ self ffiCall: #(GtkListBoxRow *gtk_list_box_row_new (void))
]

{ #category : #'instance creation' }
GtkListBoxRow class >> new [
	^ self listBoxRowNew initialize
]

{ #category : #accessing }
GtkListBoxRow >> activatable: activatable [

	self ffiCall: #(void gtk_list_box_row_set_activatable (self, gboolean activatable))
]

{ #category : #converting }
GtkListBoxRow >> asListBoxRow [
	^ self
]

{ #category : #accessing }
GtkListBoxRow >> content [

	^ self child
]

{ #category : #testing }
GtkListBoxRow >> isActivatable [

	^ self ffiCall: #(gboolean gtk_list_box_row_get_activatable (self))
]

{ #category : #testing }
GtkListBoxRow >> isSelectable [

	^ self ffiCall: #(gboolean gtk_list_box_row_get_selectable (self))
]

{ #category : #accessing }
GtkListBoxRow >> selectable: selectable [

	self ffiCall: #(void gtk_list_box_row_set_selectable (self, gboolean selectable))
]
