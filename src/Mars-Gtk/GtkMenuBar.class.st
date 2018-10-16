"
GtkMenuBar — A subclass of GtkMenuShell which holds GtkMenuItem widgets

https://developer.gnome.org/gtk3/stable/GtkMenuBar.html
"
Class {
	#name : #GtkMenuBar,
	#superclass : #GtkMenuShell,
	#category : #'Mars-Gtk-Container'
}

{ #category : #private }
GtkMenuBar class >> menuBarNew [

	^ self ffiCall: #(GtkMenuBar *gtk_menu_bar_new (void))
]

{ #category : #'instance creation' }
GtkMenuBar class >> new [

	^ self menuBarNew initialize
]
