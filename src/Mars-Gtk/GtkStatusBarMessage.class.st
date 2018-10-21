"
Convenience class to manage messages inside a context in a status bar
"
Class {
	#name : #GtkStatusBarMessage,
	#superclass : #Object,
	#instVars : [
		'text',
		'context',
		'id'
	],
	#category : #'Mars-Gtk-Widget-Display'
}

{ #category : #accessing }
GtkStatusBarMessage >> context [
	^ context
]

{ #category : #accessing }
GtkStatusBarMessage >> context: anObject [
	context := anObject
]

{ #category : #accessing }
GtkStatusBarMessage >> id [
	^ id
]

{ #category : #accessing }
GtkStatusBarMessage >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtkStatusBarMessage >> text [
	^ text
]

{ #category : #accessing }
GtkStatusBarMessage >> text: anObject [
	text := anObject
]
