"
GtkMenuShell — A base class for menu objects

https://developer.gnome.org/gtk3/stable/GtkMenuShell.html
"
Class {
	#name : #GtkMenuShell,
	#superclass : #GtkContainer,
	#category : #'Mars-Gtk-Widget-Menu'
}

{ #category : #private }
GtkMenuShell >> basicAdd: child [

	^ self ffiCall: #(void gtk_menu_shell_append (self, GtkWidget *child))
]
