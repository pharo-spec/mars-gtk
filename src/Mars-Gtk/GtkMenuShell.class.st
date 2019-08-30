"
GtkMenuShell — A base class for menu objects

https://developer.gnome.org/gtk3/stable/GtkMenuShell.html
"
Class {
	#name : #GtkMenuShell,
	#superclass : #GtkContainer,
	#category : #'Mars-Gtk-Widget-Menu'
}

{ #category : #accessing }
GtkMenuShell class >> gInit: object [ 
	"This method was automatically generated"

	^ self ffiCall: #(void gtk_menu_shell_init(void *object))
]

{ #category : #accessing }
GtkMenuShell class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_menu_shell_get_type())
]

{ #category : #accessing }
GtkMenuShell >> addFirst: aWidget [

	self keepWidgetFirst: aWidget.
	self basicAddFirst: aWidget 
]

{ #category : #private }
GtkMenuShell >> basicAdd: child [

	^ self ffiCall: #(void gtk_menu_shell_append (self, GtkWidget *child))
]

{ #category : #private }
GtkMenuShell >> basicAddFirst: child [

	^ self ffiCall: #(void gtk_menu_shell_prepend (self, GtkWidget *child))
]

{ #category : #private }
GtkMenuShell >> keepWidgetFirst: aWidget [

	children := children copyWithFirst: aWidget
]
