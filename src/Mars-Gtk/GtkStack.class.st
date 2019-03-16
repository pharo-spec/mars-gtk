"
GtkStack
GtkStack — A stacking container

https://developer.gnome.org/gtk3/stable/GtkStack.html
"
Class {
	#name : #GtkStack,
	#superclass : #GtkContainer,
	#category : #'Mars-Gtk-Widget-Container'
}

{ #category : #private }
GtkStack class >> gtkStackNew [

	^ self ffiCall: #(GtkStack *gtk_stack_new (void))
]

{ #category : #'instance creation' }
GtkStack class >> new [
	^ self gtkStackNew initialize 
]

{ #category : #adding }
GtkStack >> addChild: child withTitle: aTitle [

	self keepWidget: child.
	self 
		basicAddChild: child 
		named: aTitle
		titled: aTitle
]

{ #category : #adding }
GtkStack >> basicAddChild: child named: utf8EncodedName titled: utf8EncodedTitle [

	^ self ffiCall: #(void gtk_stack_add_titled (self, GtkWidget *child, String utf8EncodedName, String utf8EncodedTitle))
]
