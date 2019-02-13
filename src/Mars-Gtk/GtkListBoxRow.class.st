"
I'm an element inside a GtkListBox
"
Class {
	#name : #GtkListBoxRow,
	#superclass : #GtkBin,
	#category : 'Mars-Gtk-Widget'
}

{ #category : #private }
GtkListBoxRow class >> listBoxRowNew [
	^ self ffiCall: #(GtkListBoxRow *gtk_list_box_row_new (void))
]

{ #category : #'instance creation' }
GtkListBoxRow class >> new [
	^ self listBoxRowNew initialize
]

{ #category : #converting }
GtkListBoxRow >> asListBoxRow [
	^ self
]

{ #category : #accessing }
GtkListBoxRow >> content [
	^ self children first
]
